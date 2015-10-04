class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :require_user
  

  #def current_user
  #  if @current_user.nil? # && session[:user] && !session[:user]
  #    @current_user = User.find(session[:user_id]) if session[:user]
  #  end
  #end      #there is a bug on line 13
  #helper_method :current_user
  
  helper_method :current_user 

  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end

  #def require_user
  #  if current_user
  #    return true
  #  end
  #  redirect_to root_url
  #end

  def require_user 
    redirect_to '/login' unless current_user 
  end

end

