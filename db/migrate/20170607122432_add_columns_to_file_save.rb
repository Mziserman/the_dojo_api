class AddColumnsToFileSave < ActiveRecord::Migration[5.0]
  def change
    add_column :file_saves, :commit_message, :string
    add_column :file_saves, :version, :integer
    add_column :file_saves, :stream_file_id, :integer
  end
end
