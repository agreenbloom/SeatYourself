class RemovePartySizeFromReservations < ActiveRecord::Migration
  def change
    remove_column :reservations, :Partysize, :string
    add_column :reservations, :party_size, :integer

  end
end
