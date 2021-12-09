class Car < ApplicationRecord
  belongs_to :dealer

  def self.is_new?
    Car.where(new: true)
  end
end