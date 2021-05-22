class RenterReviewsController < ApplicationController

  # display all reviews about current user (as a renter)
  def index
    @renter_reviews = RenterReview.where(renter_id: current_user.id )
  end

  # create new review about a renter with current user as owner
  def new
    @renter = User.find(params[:user_id])
    @reviewer_id = current_user.id
    @renter_review = RenterReview.new
  end

  def create
    @renter_review = RenterReview.new(renter_review_params)
    @renter = User.find(params[:user_id])
    @renter_review.reviewer = current_user
    @renter_review.renter = :user_id
    @renter_review.save
    redirect_back
  end

  private

  def renter_review_params
    params.require(:renter_review).permit(:review)
  end

end
