class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where("user_id" == params[:car_id])
  end

end
