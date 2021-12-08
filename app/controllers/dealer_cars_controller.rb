class DealerCarsController < ApplicationController
  def index
    @dealer = Dealer.find(params[:dealer_id])
    if params[:sort]
      @cars = Dealer.alphabetical
    else
    @cars = @dealer.cars
    end
  end
end