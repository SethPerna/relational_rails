class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def new

  end

  def create
    city = City.create!(city_params)
    city.save
    redirect_to "/cities"
  end

  def city_params
    params.permit(:name, :population, :coastal)
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    @city.update(city_params)
    redirect_to "/cities/#{@city.id}"
  end
end
