class CreateFileSaves < ActiveRecord::Migration[5.0]
  def change
    create_table :file_saves do |t|

      t.timestamps
    end
  end
end