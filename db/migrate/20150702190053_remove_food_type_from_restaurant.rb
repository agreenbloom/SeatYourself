class RemoveFoodTypeFromRestaurant < ActiveRecord::Migration
  def change
    remove_column :restaurants, :Food_type, :string
  end
end
