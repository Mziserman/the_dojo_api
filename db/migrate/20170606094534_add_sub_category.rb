class AddSubCategory < ActiveRecord::Migration[5.0]
  def change
    create_table :sub_categories do |t|
      t.string :slug
      t.string :name
      t.belongs_to :category, index: true

      t.timestamps
    end
    create_table :streams_sub_categories, id: false  do |t|
      t.belongs_to :sub_category, index: true
      t.belongs_to :stream, index: true
    end
  end
end
