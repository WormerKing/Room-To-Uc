class Room < ApplicationRecord
  belongs_to :winner,class_name:"User",foreign_key:"winner_id"
  belongs_to :creator,class_name:"User",foreign_key:"creator_id"

  has_and_belongs_to_many :users,dependent: :destroy

  has_one_attached :video

  validates_presence_of :rules,:online,:password,:room_id

  validates :tip,inclusion:{in:["takımlı","eşli","tekli"]}

  scope :online_rooms,-> {where(online:true).order(created_at: :desc)}

  def self.denetle
    Room.where("last_activity_at < ?",1.hours.ago).update_all(online:false)
  end
end
