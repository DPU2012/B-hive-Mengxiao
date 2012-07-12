class SignupsController < ApplicationController
  def index
  	 @signup = Signup.new
  end

  def create
    @signup = Signup.new(params[:signup])
    @email = params[:signup][:email]
    @name = params[:signup][:first_name]
    @email2 = params[:signup][:email2]
  	if params[:signup][:retype_password] != params[:signup][:password]
  	 
  		flash.now[:error] = "Retyped password does not match password."
  		render 'index'
  	else
   		#@signup = Signup.new(params[:signup])
  		@signup.save
    	render :action => :show 		
  	end
  	
  	UserMailer.comments_email(@name, @email, @email2).deliver
  end
  
  def show
  end
  

end
