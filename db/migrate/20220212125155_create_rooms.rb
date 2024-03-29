class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.text :rules,null: false
      t.boolean :online,null: false
      t.integer :room_id,null: false
      t.string :password,null: false
      
      t.string :mod,null: false
      t.string :map,null: false
      
      t.belongs_to :creator, null: false
      t.timestamps
    end
    add_foreign_key :rooms, :users, column: :creator_id
  end
end
