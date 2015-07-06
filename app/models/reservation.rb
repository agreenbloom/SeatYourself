class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :date, presence: true

  validate :not_full


  private

  def not_full
    total_seats_reserved = restaurant.reservations.sum(:party_size)
    total_reservations = restaurant.reservations
    if party_size > self.restaurant.capacity
        errors.add(:party_size, "no capacity")
    end
  end



end
