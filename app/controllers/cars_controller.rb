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
      @cars = Car.all
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
    favorite_new
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
    params.require(:car).permit(:license_plate, :age, :model, :brand, :pickup_location, :rental_instructions)
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :car_id)
  end
end
