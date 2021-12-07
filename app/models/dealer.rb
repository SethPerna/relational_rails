class Dealer < ApplicationRecord
  has_many :cars

  validates_presence_of :name
  validates_presence_of :open
  validates_presence_of :zip

  def self.in_order
    Dealer.order(created_at: :desc)
  end
end