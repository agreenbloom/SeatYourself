class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :date, presence: true

  validate :not_full


  private

  def not_full
    total_seats_reserved = restaurant.reservations.where(:date => date ).sum(:party_size)
    if total_seats_reserved + party_size > self.restaurant.capacity
        errors.add(:party_size, "no capacity")
    end
  end



end
