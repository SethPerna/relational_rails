class CityVenuesController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    @venues = @city.venues
  end
end
