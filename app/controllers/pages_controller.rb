class PagesController < ApplicationController
  
  def home
    redirect_to wagons_path if logged_in?
  end
  
end