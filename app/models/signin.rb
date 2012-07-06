class Signin < ActiveRecord::Base
  attr_accessible :password, :username
  
  before_save { |signin| signin.username = username.downcase }

  username_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, :presence => true, :format => {:with => username_regex}, :uniqueness => {:case_sensitive => false}



end
