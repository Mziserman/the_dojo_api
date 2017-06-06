class AddSubCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.string :slug
      t.integer :category_id

      t.timestamps
    end
  end
end
