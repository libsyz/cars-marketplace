class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: params[:user_id])
  end

  def build
    @car = Car.find_by_id((params[:car_id]))
    @user = current_user
    @car.users << @user
    redirect_to :back
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
    redirect_to favorite_path
  end


end
