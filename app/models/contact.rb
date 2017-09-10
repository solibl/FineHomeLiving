class Contact < MailForm::Base
	require 'sendgrid-ruby'
	include SendGrid
	attribute :name, 		validate: true
	attribute :email, 		validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message, 	validate: true
	attribute :nickname, 	validate: true	
end