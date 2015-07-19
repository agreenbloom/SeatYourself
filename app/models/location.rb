class Location < ActiveRecord::Base
  attr_accessor :address, :latitude, :longitude

  belongs_to :restaurant

  geocoded_by :restaurant_location
  after_validation :geocode, :if => :restaurant_location_changed?


  def address
    [street, city, state, country].compact.join(', ')
  end

end
