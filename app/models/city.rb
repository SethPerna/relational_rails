class City < ApplicationRecord
  has_many :venues

  validates_presence_of :name
  validates_presence_of :population

  def self.in_order
    City.order(created_at: :desc)
  end

  def count_venues
    Venue.where(city_id: self.id).count
  end
end
