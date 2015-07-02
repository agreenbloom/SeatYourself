class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|

      t.integer :capacity

      t.timestamps null: false
    end
  end
end
