class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_corsogroup, :logged_in?
  
  def current_corsogroup
    @current_corsogroup ||= Corsogroup.find(session[:corsogroup_id]) if session[:corsogroup_id]
  end
  
  def logged_in?
    !!current_corsogroup
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end
end
