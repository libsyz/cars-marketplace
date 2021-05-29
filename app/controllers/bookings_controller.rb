class BookingsController < ApplicationController
  def index
    @booking = Booking.all
    @requests = Booking.joins(:car).where("cars.owner_id = #{current_user.id} and bookings.status = 'pending'")
    @accepted = Booking.joins(:car).where("cars.owner_id = #{current_user.id} and bookings.status = 'accepted'")
    @rejected = Booking.joins(:car).where("cars.owner_id = #{current_user.id} and bookings.status = 'rejected'")
    @request_count = @requests.count
    @accept_count = @accepted.count
    @reject_count = @rejected.count
  end

  def new
    @booking = Booking.new
  end

  def create
    @car= Car.find(params[:car_id])
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user_id = current_user.id
    @booking.status = "pending"

    if @booking.save
      session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: [{
          name: @booking.car.license_plate,
          amount: @booking.price.to_i,
          currency: 'sgd',
          quantity: 1
        }],
        success_url: booking_success_url,
        cancel_url: booking_success_url
      )

      @session = session.id

      render "bookings/order"
    else
      render "cars/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status)
  end
end
