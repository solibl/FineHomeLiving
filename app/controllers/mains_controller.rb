class MainsController < ApplicationController
	include SendGrid
	
	def index
		@albums = Album.all
		@images = Image.all
		@contact = Contact.new
		@projects = Album.order("created_at DESC")
	end

	def create
		from = Email.new(email: params[:contact]["name"] + "<" + params[:contact]["email"] + ">")
		subject = 'From FineHomeLiving.com'
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