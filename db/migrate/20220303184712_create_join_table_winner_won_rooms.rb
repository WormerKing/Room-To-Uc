class CreateJoinTableWinnerWonRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :winner_rooms,id:false do |t|
      t.belongs_to :room
      t.belongs_to :user
    end
  end
end
