class FavoritesController < ApplicationController

  def favorite
    @car = Car.find_by_id((params[:car_id]))
    @user = current_user
    @car.users << @user
    redirect_to :back
  end

end
