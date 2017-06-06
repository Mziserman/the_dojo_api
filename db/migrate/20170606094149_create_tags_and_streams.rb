class CreateTagsAndStreams < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_streams do |t|
      t.belongs_to :stream, index: true
      t.belongs_to :sub_category, index: true
    end
  end
end
