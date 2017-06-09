class AddTwitchToStreams < ActiveRecord::Migration[5.0]
  def change
    add_column :streams, :twitch_stream_id, :integer, limit: 8
    add_column :streams, :twitch_created_at, :datetime
    add_column :streams, :twitch_name, :string
    add_column :streams, :viewers, :integer, default: 0
    add_column :streams, :live, :boolean, default: true
    add_column :streams, :max_viewers, :integer, default: 0
    add_column :streams, :description, :string
  end
end
