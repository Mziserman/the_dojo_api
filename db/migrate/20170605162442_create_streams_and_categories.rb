class CreateStreamsAndCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories_streams, id: false  do |t|
      t.belongs_to :stream, index: true
      t.belongs_to :category, index: true
    end
  end
end
