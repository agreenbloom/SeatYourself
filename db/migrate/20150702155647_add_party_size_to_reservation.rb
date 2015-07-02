class AddPartySizeToReservation < ActiveRecord::Migration
  def change
    add_column :reservations, :Partysize, :integer
  end
end
