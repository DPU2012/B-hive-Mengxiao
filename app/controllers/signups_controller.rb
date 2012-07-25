class SignupsController < ApplicationController
	include SigninsHelper

  def index
  	 @signup = Signup.new
  end

  def create
    @signup = Signup.new(params[:signup])
    @email = params[:signup][:email]
    @first_name = params[:signup][:first_name]
    @last_name = params[:signup][:last_name]
    @role = params[:signup][:role]
    @email2 = params[:signup][:email2]
    
    
    if Signup.all.length == 0
		@signup.User_Id = 1
		@signup.status = "pending"
	else
		@signup2 = Signup.find_by_email(@signup.email2)
		if @signup2.nil?
			@signup.User_Id = Signup.all.sort_by{|signup|signup.User_Id}.last.User_Id + 1
			@signup.status = "pending"
		else
			@signup.update_attribute(:User_Id, @signup2.User_Id)
			@signup.status = "complete"
			@signup2.update_column(:status, "complete")
			#@signup2.save!
		end
	end
	
    
  	if params[:signup][:retype_password] != params[:signup][:password]
  	 
  		flash.now[:error] = "Retyped password does not match password."
  		#render 'index'
  	else
   		#@signup = Signup.new(params[:signup])
  		@signup.save
    	#render :action => :show 		
  	end
  	
   if @signup.save
   		if @signup.status == "pending" 
  			UserMailer.registration_email1(@first_name, @last_name, @role, @email, @email2).deliver
  			if @signup.role == "parent"
  				sign_in @signup
  			end
  		else
  			UserMailer.registration_email2(@first_name, @last_name, @role, @email, @email2).deliver
  			sign_in @signup
  		end
  		render :action => :show
  	else
  		render 'index'
  	end
  	
	
  		
  	
  	
  end
  
  def show
  end

end
