class AddTimeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :time, :datetime
  end
end
