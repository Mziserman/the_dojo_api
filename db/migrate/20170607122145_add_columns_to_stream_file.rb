class AddColumnsToStreamFile < ActiveRecord::Migration[5.0]
  def change
    add_column :stream_files, :name, :string
    add_column :stream_files, :format, :string
    add_column :stream_files, :stream_id, :integer
  end
end
