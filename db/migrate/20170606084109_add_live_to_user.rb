class AddLiveToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :live, :boolean
    add_column :users, :channel, :string, index: true, unique: true
  end
end
