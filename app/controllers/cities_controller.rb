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
    city = City.create!(name: params[:name], population: params[:population], coastal: params[:coastal])
    city.save
    redirect_to "/cities"
  end
end
