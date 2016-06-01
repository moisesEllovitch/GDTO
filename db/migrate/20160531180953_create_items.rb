class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :category
      t.string :institution
      t.integer :average

      t.timestamps null: false
    end
  end

  def down
  	drop_table :items
  end
end