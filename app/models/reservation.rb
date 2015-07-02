class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :table

  # validates :not_full

  # def not_full
  #   if full
  #     self.errors.add(:not_full, "Restaurant at capacity")
  #   end
  # end
end
