class AddColumnsToFileCommit < ActiveRecord::Migration[5.0]
  def change
    add_column :file_commits, :commit_message, :string
    add_column :file_commits, :path, :string
    add_column :file_commits, :version, :integer
    add_column :file_commits, :stream_file_id, :integer
  end
end
