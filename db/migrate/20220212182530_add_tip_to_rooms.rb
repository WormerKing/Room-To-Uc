class AddTipToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :tip, :string
  end
end
