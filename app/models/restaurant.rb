class Restaurant < ActiveRecord::Base
  # belongs_to :owner, class_name: "User"

  has_many :reservations
  belongs_to :category


  private

  def not_full?
    @reservation = reservations.where(start_time: start_time).sum(:Partysize)
    Partysize <= capacity
  end


end
