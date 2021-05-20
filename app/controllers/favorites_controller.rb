class FavoritesController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: params[:user_id])
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy
  end


end
