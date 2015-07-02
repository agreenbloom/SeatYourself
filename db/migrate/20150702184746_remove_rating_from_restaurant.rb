class RemoveRatingFromRestaurant < ActiveRecord::Migration
  def change
    remove_column :restaurants, :rating, :string
    remove_column :restaurants, :integer, :string
  end
end
