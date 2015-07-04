class AddStartTimeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :start_time, :datetime
    add_column :reservations, :date, :datetime
  end
end
