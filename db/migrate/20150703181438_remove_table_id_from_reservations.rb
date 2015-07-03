class RemoveTableIdFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :table_id, :integer
  end
end
