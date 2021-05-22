class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: params[:user_id])
    render "users/index"
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @favorite.user = current_user
    @favorite.save

    # no need for app/views/restaurants/create.html.erb
    redirect_to car_path(@favorite.car)
  end

  def destroy
    @favorite = Favorite.where(:user_id => current_user.id, :car_id => params[:car_id]).first
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:car_id)
  end
end
