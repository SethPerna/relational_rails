class Dealer < ApplicationRecord
  has_many :cars, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :open
  validates_presence_of :zip

  def self.in_order
    Dealer.order(created_at: :desc)
  end

  def count_cars
    Car.where(dealer_id: self.id).count
  end

  def self.alphabetical
    Car.order(:make)
  end
end