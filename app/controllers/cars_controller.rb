require 'json'
require 'pry-byebug'
require 'ostruct'

class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    # 1. Find me all cars that are within the booking timeframe
    start_date_search = params[:search][:start_date]
    end_date_search = params[:search][:end_date]
    sql = "select * from cars join bookings on cars.id = bookings.car_id
    where (bookings.start_date > cast(case when '#{end_date_search}' = '' then null else '#{end_date_search}' end AS date)
    OR bookings.end_date < cast(case when '#{start_date_search}' = '' then null else '#{start_date_search}' end AS date))"
    results = ActiveRecord::Base.connection.execute(sql)

    # 2. Get cars address
    @cars = []
    results.each do |car|
      distance = Geocoder::Calculations.distance_between(car["pickup_location"], params[:search][:address])
      if distance < 10
        os = OpenStruct.new car
        @cars << os
      else
        next
      end
    end

    #map markers for cars
    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude
      }
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.owner_id = current_user.id
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
    @favorite = Favorite.new
  end

  def edit
  end

  def update
    @car.update(car_params)
    redirect_to car_path(@car)
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  def favorite_new
    @favorite = Favorite.new
  end

  def favorite_save
    @favorite = Favorite.new(favorite_params)
    @favorite.save

    # no need for app/views/restaurants/create.html.erb
    redirect_to favorite_path(@favorite)
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:license_plate, :age, :model, :brand, :pickup_location, :rental_instructions, :image_urls)
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :car_id)
  end
end
