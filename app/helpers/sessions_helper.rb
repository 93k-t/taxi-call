module SessionsHelper
  def login_user
    @login_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!login_user
  end
end
