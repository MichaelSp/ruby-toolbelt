class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.integer :lft
      t.integer :rgt
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
