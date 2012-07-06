class SigninsController < ApplicationController
  def index
    @signin = Signin.new
  end

  def create
    signin = Signin.new(params[:signin])
  	#@signin.save
  	#render :action => :show
  	
  	signup = Signup.authenticate(params[:signin][:username], params[:signin][:password])
  	if signup.nil?
  		flash.now[:error1] = "Invalid email/password combination"
  		render 'index'
	else
		signin[:remember_token] = signup.id #this stores the id of the user who's logged in the session
		render :action => :show
		#redirect to :
	end
  end  

  def show
  end
end
