class CarReviewsController < ApplicationController

  def new
    @car = Car.find(params[:car_id])
    @car_review = CarReview.new
  end

  def create
    @car_review = CarReview.new(car_review_params)
    @car = Car.find(params[:car_id])
    @car_review.car = @car
    @car_review.user = current_user
    @car_review.save
    redirect_to car_path(@car)
  end

  private

  def car_review_params
    params.require(:car_review).permit(:review)
  end
end
