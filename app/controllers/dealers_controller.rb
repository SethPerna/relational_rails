class DealersController < ApplicationController
  def index
    @dealers = Dealer.all
  end

  def show
    @dealer = Dealer.find(params[:id])
  end

  def new
  end

  def create
    # require "pry"; binding.pry
    dealer = Dealer.create!(dealer_params)
    dealer.save

    redirect_to "/dealers"
  end

  def edit
    # require "pry"; binding.pry
    @dealer = Dealer.find(params[:id])
  end

  def update
    @dealer = Dealer.find(params[:id])
    @dealer.update(dealer_params)

    redirect_to "/dealers/#{@dealer.id}"
  end

  def destroy
    dealer = Dealer.find(params[:id])
    dealer.destroy

    redirect_to "/dealers"
  end

  private

  def dealer_params
    params.permit(:name, :open, :zip)
  end
end