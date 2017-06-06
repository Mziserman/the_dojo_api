class AddSubCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.string :slug
      t.belongs_to :category, index: true

      t.timestamps
    end
  end
end
