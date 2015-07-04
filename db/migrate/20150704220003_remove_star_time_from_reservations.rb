class RemoveStarTimeFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :start_time, :datetime
    remove_column :reservations, :time, :datetime

  end
end
