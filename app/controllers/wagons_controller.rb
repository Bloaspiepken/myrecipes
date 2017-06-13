class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @wagons = Wagon.paginate(page: params[:page], per_page: 5)
  end
  
  def show
    @comment = Comment.new
    @comments = @wagon.comments.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @wagon = Wagon.new
  end
  
  def create
    @wagon = Wagon.new(wagon_params)
    @wagon.corsogroup = current_corsogroup
    if @wagon.save
      flash[:success] = "Float was created successfully!"
      redirect_to wagon_path(@wagon)
    else
      render 'new'
    end
  end
  
  def edit

  end
  
  def update
    if @wagon.update(wagon_params)
      flash[:success] = "Float was updated successfully"
      redirect_to wagon_path(@wagon)
    else
      render 'edit'
    end
  end
  
  def destroy
    Wagon.find(params[:id]).destroy
    flash[:success] = "Float deleted successfully"
    redirect_to wagons_path
  end
  
  private
  
  def set_wagon
    @wagon = Wagon.find(params[:id])
  end
  
  def wagon_params
    params.require(:wagon).permit(:name, :description, ingredient_ids: [])
  end
  
  def require_same_user
      if current_corsogroup != @wagon.corsogroup and !current_corsogroup.admin?
        flash[:danger] = "You can only edit or delete your own floats"
        redirect_to wagons_path
      end
  end
  
end