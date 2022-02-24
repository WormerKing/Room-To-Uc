class AddLastActivityAtToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :last_activity_at, :datetime
  end
end
