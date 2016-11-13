class AddCategoryRefToItems < ActiveRecord::Migration
  def up
    add_reference(:items, :category, foreign_key: true, :null => true)
    remove_column(:items, :category, :string)
  end

  def down
  	remove_column :items, :category_id
  	add_column :items, :category, :string
  end
end
