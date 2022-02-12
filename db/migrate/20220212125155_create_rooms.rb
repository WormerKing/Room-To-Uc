class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.text :rules
      t.boolean :online
      t.integer :room_id
      t.string :password
      t.belongs_to :winner
      t.belongs_to :creator, null: false

      t.timestamps
    end
    add_foreign_key :rooms, :users, column: :winner_id
    add_foreign_key :rooms, :users, column: :creator_id
  end
end
