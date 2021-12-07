class CityVenuesController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    if params[:sort]
      @venues = City.alphabetical
    elsif params[:capacity]
      @venues = City.capacity_filter(params[:capacity])
    else
      @venues = @city.venues
    end
  end
end
