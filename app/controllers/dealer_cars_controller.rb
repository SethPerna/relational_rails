class DealerCarsController < ApplicationController
  def index
    dealer = Dealer.find(params[:dealer_id])
    @cars = dealer.cars
  end
end