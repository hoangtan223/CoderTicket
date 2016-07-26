class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :is_logged_in?

  def current_user
    return @current_user if @current_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
    end
  end

  def is_logged_in?
    current_user ? true : false
  end

  def require_login
    unless is_logged_in?
      flash[:notice] = "You must sign in first to see this page"
      redirect_to root_path
    end
  end

  def skip_if_logged_in
    if is_logged_in?
      redirect_to users_path
    end
  end
end
