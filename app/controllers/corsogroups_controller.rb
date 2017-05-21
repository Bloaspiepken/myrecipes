class CorsogroupsController < ApplicationController
  
  before_action :set_corsogroup, only: [:show, :edit, :update, :destroy]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @corsogroups = Corsogroup.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @corsogroup = Corsogroup.new
  end
  
  def create
   @corsogroup = Corsogroup.new(corsogroup_params)
   if @corsogroup.save
     session[:corsogroup_id] = @corsogroup.id
     flash[:success] = "Welcome #{@corsogroup.corsoname} to MyFloats App!"
     redirect_to corsogroup_path(@corsogroup)
   else
     render 'new'
   end
  end
  
  def show
    @corsogroup_wagons = @corsogroup.wagons.paginate(page: params[:page], per_page: 5)
  end
  
  def edit

  end
  
  def update
    if @corsogroup.update(corsogroup_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to @corsogroup
    else
      render 'edit'
    end
  end
  
  def destroy
   @corsogroup.destroy
   flash[:danger] = "Corsogroup and all associated floats have been deleted"
   redirect_to corsogroups_path
  end
  
  private 
  
  def corsogroup_params
    params.require(:corsogroup).permit(:corsoname, :email, :password, :password_confirmation)
  end
  
  def set_corsogroup
       @corsogroup = Corsogroup.find(params[:id])
  end
  
  def require_same_user
    if current_corsogroup != @corsogroup
      flash[:danger] = "You can only edit or delete your own account"
      redirect_to corsogroups_path
    end
  end
  
  
end