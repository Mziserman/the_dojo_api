class CreateStreams < ActiveRecord::Migration[5.0]
  def change
    create_table :streams do |t|
      t.integer :user_id

      t.timestamps
    end
  end
end
