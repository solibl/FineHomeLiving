class Contact < MailForm::Base
	require 'sendgrid-ruby'
	include SendGrid
	attribute :name, 		validate: true
	attribute :email, 		validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message, 	validate: true
	attribute :nickname, 	validate: true	

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
	
	def headers
		{
			subject: "Contact Form",
			to: "brianleedongjun@gmail.com",
			from: %("#{name}" <#{email})
		}
	end

end