class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @cars = Car.where("name LIKE ?","%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @cars = Car.where.not(latitude: nil, longitude: nil)
      @markers = @cars.map do |car|
        {
          lat: car.latitude,
          lng: car.longitude
        }
      end
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

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:license_plate, :age, :model, :brand, :pickup_location, :rental_instructions, :image_urls)
  end
end
