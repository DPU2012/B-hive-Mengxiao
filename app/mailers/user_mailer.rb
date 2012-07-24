class UserMailer < ActionMailer::Base
  default :from => "letsbhive@gmail.com"
  
  def registration_email1(first_name,last_name,role,email,email2)
  	@first_name = first_name
  	@last_name = last_name
  	@role = role
  	@email = email
  	@email2 = email2
  	@url = "http://www.google.com"
  	@url2 = "http://localhost:3000/signup"
  	mail(:to => @email2, :subject => "Email from B-hive")
  end
  
  def registration_email2(first_name,last_name,role,email,email2)
  	@first_name = first_name
  	@last_name = last_name
  	@role = role
  	@email = email
  	@email2 = email2
  	@url = "http://www.google.com"
  	mail(:to => @email2, :subject => "Let's B-hive")
  end  
  
end
