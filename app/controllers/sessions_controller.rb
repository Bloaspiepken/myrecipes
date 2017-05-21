class SessionsController < ApplicationController

  def new
    
  end
  
  def create
    corsogroup = Corsogroup.find_by(email: params[:session][:email].downcase)
    if corsogroup && corsogroup.authenticate(params[:session][:password])
      session[:corsogroup_id] = corsogroup.id
      flash[:success] = "You have successfully logged in"
      redirect_to corsogroup
    else
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end
  
  def destroy
    session[:corsogroup_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end
