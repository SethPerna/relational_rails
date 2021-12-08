class CityVenuesController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    if params[:sort]
      @venues = @city.alphabetical
    elsif params[:capacity]
      @venues = @city.capacity_filter(params[:capacity])
    else
      @venues = @city.venues
    end
  end
end
