module SigninsHelper

  def sign_in(signup)
    cookies.permanent[:remember_token] = signup.remember_token
    self.current_signup = signup
  end
  
  def signed_in?
    !current_signup.nil?
  end

  def current_signup=(signup)
    @current_signup = signup
  end
  
  def current_signup
    @current_signup ||= Signup.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_signup = nil
    cookies.delete(:remember_token)
  end
end
