class SigninsController < ApplicationController
	include SigninsHelper
	
  def index
  
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
		if signup.status == "pending" and signup.role == "teenager"
			flash.now[:error2] = "You account is pending.  Please wait until your parent signs up." 
			render'index'
		else
			#signin[:remember_token] = signup.id #this stores the id of the user who's logged in the session
			sign_in signup
			render :action => :show
			#redirect to :			
		end	
	end
  end  
  
    def destroy
    sign_out
    render 'index'
    end

  def show
  end
  

end
