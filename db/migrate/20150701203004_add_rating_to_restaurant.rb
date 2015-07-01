class AddRatingToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :rating, :string
    add_column :restaurants, :integer, :string
  end
end
