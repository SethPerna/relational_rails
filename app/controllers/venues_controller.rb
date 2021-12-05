class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def new
    @city = City.find(params[:id])

  end

  def create
    @city = City.find(params[:id])
    venue = @city.venues.create!(venue_params)
    venue.save
    redirect_to "/cities/#{@city.id}/venues"
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to "/venues/#{@venue.id}"
  end

  private
  def venue_params
    params.permit(:name, :capacity, :indoor)
  end
end
