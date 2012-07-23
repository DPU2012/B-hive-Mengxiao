class SigninsController < ApplicationController
  def index
    @signin = Signin.new
  end

  def create
    signin = Signin.new(params[:signin])
  	#@signin.save
  	#render :action => :show
  	
  	signup = Signup.authenticate(params[:signin][:username], params[:signin][:password])
  	signup2 = Signup.find_by_email(params[:signin][:username])
  	if signup.nil?
  		flash.now[:error1] = "Invalid email/password combination"
  		render 'index'
	else
		if signup2.status = "pending" #and signup.role = "t"
			flash.now[:error2] = "You account is pending.  Please wait until your parent signs up." 
			render'index'
		else
			signin[:remember_token] = signup.id #this stores the id of the user who's logged in the session
			render :action => :show
			#redirect to :			
		end	
	end
  end  

  def show
  end
end
