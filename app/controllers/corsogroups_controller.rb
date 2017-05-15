class CorsogroupsController < ApplicationController
  
  def index
    @corsogroups = Corsogroup.paginate(page: params[:page], per_page: 5)
  end
  
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
    @corsogroup_wagons = @corsogroup.wagons.paginate(page: params[:page], per_page: 5)
  end
  
  def edit
    @corsogroup = Corsogroup.find(params[:id])
  end
  
  def update
    @corsogroup = Corsogroup.find(params[:id])
    if @corsogroup.update(corsogroup_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to @corsogroup
    else
      render 'edit'
    end
  end
  
  private 
  
  def corsogroup_params
    params.require(:corsogroup).permit(:corsoname, :email, :password, :password_confirmation)
  end
end