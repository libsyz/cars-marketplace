class RequestsController < ApplicationController
  def accept
    @booking = Booking.find(params[:booking_id])
    @booking.status = 'accepted'
    @booking.save
    redirect_to bookings_path
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    @booking.status = 'rejected'
    @booking.save
    redirect_to bookings_path
  end
end
