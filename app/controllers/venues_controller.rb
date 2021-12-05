class VenuesController < ApplicationController
  def index
    @venues = Venue.all
  end

  def show
    @venue = Venue.find(params[:id])
  end

  def create
    venue = Venue.create!(venue_params)
    venue.save
    redirect_to "/venues"
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def update
    @venue = Venue.find(params[:id])
    @venue.update(venue_params)
    redirect_to "/venues"
  end

  private
  def venue_params
    params.permit(:name, :capacity, :indoor, :city_id)
  end
end
