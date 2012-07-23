require 'digest'

class Signup < ActiveRecord::Base
  attr_accessor :password, :day, :month, :year
  attr_accessible :email, :email2, :first_name, :last_name, :password, :retype_password, :sex, :day, :month, :year, :role, :status, :User_Id, 
  
  before_save { |signup| signup.email = email.downcase }
  before_save { |signup| signup.email2 = email2.downcase }
  before_save :encrypt_password

  
  #birthday
  MONTHS = ["January", 1], ["February", 2], ["March", 3], ["April", 4], ["May", 5], ["June", 6], ["July", 7], ["August", 8], ["September", 9], ["October", 10], ["November", 11], ["December", 12]
  DAYS = ["01", 1], ["02", 2], ["03", 3], ["04", 4], ["05", 5], ["06", 6], ["07", 7], ["08", 8], ["09", 9], ["10", 10], ["11", 11], ["12", 12], ["13", 13], ["14", 14], ["15", 15], ["16", 16],
        ["17", 17], ["18", 18], ["19", 19], ["20", 20], ["21", 21], ["22", 22], ["23", 23], ["24", 24], ["25", 25], ["26", 26], ["27", 27], ["28", 28], ["29", 29], ["30", 30], ["31", 31]
  START_YEAR = Time.now.year - 111
  END_YEAR = Time.now.year
  YEAR_RANGE = START_YEAR..END_YEAR
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  alpha_regex = /^[a-zA-Z]*$/
  alpha_numeric_regix = /^[a-zA-Z0-9_]*$/


  validates :first_name, :presence => true, :length => {:minimum => 2, :maximum => 15}, :format => {:with => alpha_regex}
  validates :last_name, :presence => true, :length => {:maximum => 20}
  validates :email, :presence => true, :format => {:with => email_regex}, :uniqueness => {:case_sensitive => false}
  validates :email2, :format => {:with => email_regex}, :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true, :confirmation => true, :length => {:within => 6..40}
 

 
  def has_password? (password)
  	encrypted_password == encrypt(password)
  end 
  
  
  def self.authenticate(email, submitted_password)
  	signup = find_by_email(email)
  	return nil if signup.nil?
  	return signup if signup.has_password?(submitted_password)
  end

	  
  private
  def encrypt_password
  	self.salt = make_salt unless has_password?(password)
  	self.encrypted_password = encrypt(password)
  end
  
  def encrypt(string)
  	secure_hash("#{salt}--#{string}")
  end

  def make_salt
  	secure_hash("#{Time.now.utc}--#{password}")
  end
  
  def secure_hash(string)
  	Digest::SHA2.hexdigest(string)
  end
  
  
  
  
  
  
  
end
