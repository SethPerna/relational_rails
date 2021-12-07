class City < ApplicationRecord
  has_many :venues, :dependent => :destroy

  validates_presence_of :name
  validates_presence_of :population

  def self.in_order
    City.order(created_at: :desc)
  end

  def count_venues
    Venue.where(city_id: self.id).count
  end

  def self.alphabetical
    Venue.order(:name)
  end

  def self.capacity_filter(capacity)
    Venue.where('capacity > ?', capacity)
  end
end
