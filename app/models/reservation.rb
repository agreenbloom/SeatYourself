class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  #validates :not_full

  #def not_full
   #<%# if @restaurant == @restaurant.capacity %>
     # <% #@reservation.errors.full_messages.each do |msg| %>
      #<li>
       # <%= #msg: "Restaurant at capacity" %>
      #</li>
    #  <% end %>
    #end
  #end

end
