class RemoveSteamFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :channel
    add_column :streams, :channel, :string
    add_column :streams, :live, :boolean
  end
end
