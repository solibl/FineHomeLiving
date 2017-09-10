class MainsController < ApplicationController
	def index
		@albums = Album.all
		@images = Image.all
		@contact = Contact.new
		@projects = Album.order("created_at DESC")
	end

	def create
		@contact = Contact.new
		from = Email.new(email: 'test@example.com')
		subject = 'Hello World from the SendGrid Ruby Library!'
		to = Email.new(email: 'test@example.com')
		content = Content.new(type: 'text/plain', value: 'Hello, Email!')
		mail = Mail.new(from, subject, to, content)

		sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
		response = sg.client.mail._('send').post(request_body: mail.to_json)
		puts response.status_code
		puts response.body
		puts response.headers
		if @contact.deliver
			flash.now[:success] = "The email has been sent"
		else
			flash.now[:alert] = "Can not send message."
			redirect_to root_path
		end
	end
end