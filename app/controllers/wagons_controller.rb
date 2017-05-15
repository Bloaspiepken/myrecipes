class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update]
  
  def index
    @wagons = Wagon.paginate(page: params[:page], per_page: 5)
  end
  
  def show

  end
  
  def new
    @wagon = Wagon.new
  end
  
  def create
    @wagon = Wagon.new(wagon_params)
    @wagon.corsogroup = Corsogroup.last
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
    params.require(:wagon).permit(:name, :description)
  end
end