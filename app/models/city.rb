class City < ApplicationRecord
  has_many :venues, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :population

  def self.in_order
    City.order(created_at: :desc)
  end

  def self.order_by_venues
    City.order()
  end

  def count_venues
    Venue.where(city_id: self.id).count
  end

  def alphabetical
    venues.order(:name)
  end

  def capacity_filter(capacity)
    venues.where('capacity > ?', capacity)
  end
end
