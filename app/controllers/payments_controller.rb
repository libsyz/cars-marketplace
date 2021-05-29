class PaymentsController < ApplicationController
  def new
    @order = current_user.bookings.find(params[:booking_id])
  end
end
