class CreateStreamFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :stream_files do |t|

      t.timestamps
    end
  end
end
