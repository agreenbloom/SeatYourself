class FixCategoryIdRelationship < ActiveRecord::Migration
  def change
    remove_column :categories, :restaurant_id, :integer
    add_column :restaurants, :category_id, :integer
  end
end
