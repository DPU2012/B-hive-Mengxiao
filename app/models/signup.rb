class Signup < ActiveRecord::Base
  attr_accessor :password #creates the virtual attributes password
  attr_accessible :birthday, :email, :email2, :first_name, :last_name, :password, :retype_email, :retype_password, :sex
  
  before_save { |signup| signup.email = email.downcase }
  before_save { |signup| signup.retype_email = retype_email.downcase }
  before_save { |signup| signup.email2 = email2.downcase }

  
  validates :first_name, :presence => true, :length => {:maximum => 20}
  validates :last_name, :presence => true, :length => {:maximum => 20}
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => {:with => email_regex}, :uniqueness => {:case_sensitive => false}
  validates :email2, :presence => true, :format => {:with => email_regex}, :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true, :confirmation => true, :length => {:within => 6..40}






end
