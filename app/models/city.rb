class City < ApplicationRecord
  has_many :venues

  validates_presence_of :name
  validates_presence_of :population
  #validates_presence_of :coastal
end
