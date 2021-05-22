class UsersController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: params[:user_id])
    @car_reviews = CarReview.where(user_id: params[:user_id])
  end

end
