class AddColumnsToStreamFile < ActiveRecord::Migration[5.0]
  def change
    add_column :stream_files, :file_name, :string
    add_column :stream_files, :file_format, :string
    add_column :stream_files, :stream_id, :integer
  end
end
