class AddThumbnailToStream < ActiveRecord::Migration[5.0]
  def change
    add_column :streams, :thumbnail, :string
  end
end
