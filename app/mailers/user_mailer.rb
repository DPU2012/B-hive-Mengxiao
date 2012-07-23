class UserMailer < ActionMailer::Base
  default :from => "letsbhive@gmail.com"
  
  def registration_email(name,email,email2)
  	@name = name
  	@email = email
  	@email2 = email2
  	@url = "http://www.google.com"
  	mail(:to => @email2, :subject => "Email from Bhive")
  end
end
