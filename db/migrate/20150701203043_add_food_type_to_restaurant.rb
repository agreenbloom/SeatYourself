class AddFoodTypeToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :Food_type, :string
  end
end
