class CorsogroupsController < ApplicationController
  
  def new
    @corsogroup = Corsogroup.new
  end
  
  def create
   @corsogroup = Corsogroup.new(corsogroup_params)
   if @corsogroup.save
     flash[:success] = "Welcome #{@corsogroup.corsoname} to MyFloats App!"
     redirect_to corsogroup_path(@corsogroup)
   else
     render 'new'
   end
  end
  
  def show
    @corsogroup = Corsogroup.find(params[:id])
  end
  
  private 
  
  def corsogroup_params
    params.require(:corsogroup).permit(:corsoname, :email, :password, :password_confirmation)
  end
end