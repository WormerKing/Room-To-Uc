class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.boolean :processed
      t.belongs_to :room, null: false

      t.timestamps
    end
    add_foreign_key :logs, :rooms, column: :room_id
  end
end
