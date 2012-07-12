class UserMailer < ActionMailer::Base
  default :from => "letsbhive@gmail.com"
  
  def comments_email(name,email,email2)
  	@name = name
  	@email = email
  	@email2 = email2
  	mail(:to => @email2, :subject => "Email from Bhive")
  end
end
