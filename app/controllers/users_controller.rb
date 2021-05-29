class UsersController < ApplicationController

  def index
    @favorites = Favorite.where(user_id: params[:user_id])
    @car_reviews = CarReview.where(user_id: params[:user_id])
    @confirmed = Booking.all.where("user_id = #{current_user.id} and bookings.status = 'accepted'")
    @declined = Booking.all.where("user_id = #{current_user.id} and bookings.status = 'rejected'")
  end

end
