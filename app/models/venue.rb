class Venue < ApplicationRecord
  belongs_to :city

  def self.true_records
     Venue.where(indoor: true)
  end


end
