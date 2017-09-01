class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def signed_in?
    current_user
  end
  helper_method :signed_in?

  def current_user
    @current_user || User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authenticate 
    redirect_to root_url unless signed_in?
  end

end
