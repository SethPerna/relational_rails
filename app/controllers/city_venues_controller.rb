class CityVenuesController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    if params[:sort]
      @venues = City.alphabetical
    else
      @venues = @city.venues
    end
  end
end
