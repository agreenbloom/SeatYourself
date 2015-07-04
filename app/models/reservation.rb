class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant


  #validate :not_full, on :create

  #private

  #def not_full
   #if @restaurant == @restaurant.capacity
    # @reservation.errors.full_messages.each do |msg|
     # <p> msg: "Restaurant at capacity" </p>
     # end
  # end
  #end

end
