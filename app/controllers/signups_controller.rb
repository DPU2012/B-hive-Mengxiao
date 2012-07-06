class SignupsController < ApplicationController
  def index
  	 @signup = Signup.new
  end

  def create
  	if params[:signup][:retype_password] != params[:signup][:password]
  		flash.now[:error] = "Retyped password does not match password."
  		render 'index'
  	else
   		@signup = Signup.new(params[:signup])
  		@signup.save
    	render :action => :show 		
  	end
  end
  
  def show
  end
  

end
