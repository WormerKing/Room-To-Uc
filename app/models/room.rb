class Room < ApplicationRecord
  belongs_to :winner,class_name:"User",foreign_key:"winner_id",dependent: :destroy
  belongs_to :creator,class_name:"User",foreign_key:"creator_id",dependent: :destroy

  has_and_belongs_to_many :users,dependent: :destroy

  validates :winner,presence:false
end
