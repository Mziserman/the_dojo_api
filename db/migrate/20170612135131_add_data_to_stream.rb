class AddDataToStream < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :stream_description, :string
    add_column :users, :site_url, :string
    add_column :users, :schedule, :string
    add_column :users, :community, :string
    add_column :users, :rules, :string
  end
end
