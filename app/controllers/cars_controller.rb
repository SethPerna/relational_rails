class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def new
    @dealer = Dealer.find(params[:id])
  end

  def create
    @dealer = Dealer.find(params[:id])
    car = @dealer.cars.create!(car_params)
    car.save

    redirect_to "/dealers/#{@dealer.id}/cars"
  end

  private

  def car_params
    params.permit(:make, :new, :year, :vin)
  end
end