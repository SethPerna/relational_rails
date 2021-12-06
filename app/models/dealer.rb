class Dealer < ApplicationRecord
  has_many :cars

  validates_presence_of :name
  validates_presence_of :open
  validates_presence_of :zip
end