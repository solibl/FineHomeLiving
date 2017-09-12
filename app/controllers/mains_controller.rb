class MainsController < ApplicationController
	include SendGrid
	
	def index
		@albums = Album.all
		@images = Image.all
		@contact = Contact.new
		@projects = Album.order("created_at DESC")
	end

	def create
		if params[:contact]["nickname"] != ""
			redirect_to root_path
		else
			from = Email.new(email: params[:contact]["email"])
			subject = params[:contact]["name"]+' from FineHomeLiving.com'
			to = Email.new(email: 'brianleedongjun@gmail.com')
			content = Content.new(type: 'text/plain', value: params[:contact]["message"])
			mail = Mail.new(from, subject, to, content)

			sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
			response = sg.client.mail._('send').post(request_body: mail.to_json)
			puts response.status_code
			puts response.body
			puts response.headers
		end
	end
end