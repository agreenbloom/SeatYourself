class Restaurant < ActiveRecord::Base
  # belongs_to :owner, class_name: "User"

  has_many :reservations
  belongs_to :category
  has_many :locations

  geocoded_by :address
  after_validation :geocode

  private

  def not_full?
    @reservation = reservations.where(start_time: start_time).sum(:party_size)
    :party_size <= capacity
  end


end
