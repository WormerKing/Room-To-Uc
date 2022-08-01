class Room < ApplicationRecord
    belongs_to :creator,class_name:"User",foreign_key:"creator_id"

    has_one :log,class_name:"Log",foreign_key:"room_id",dependent: :destroy
    
    has_and_belongs_to_many :users,join_table:"rooms_users"

    has_and_belongs_to_many :winners,join_table:"winner_rooms",class_name:"User",foreign_key:"room_id"

    has_one_attached :video

    validates_presence_of :rules,:online,:password,:room_id,:mod,:map

    validates :tip,inclusion:{in:["takımlı","eşli","tekli"]}

    validates :mod,inclusion:{in:["FPP","TPP"]}

    validates :map,inclusion:{in:["Erangel","Miramar","Sanhok","Vikendi"]}

    #validates_uniqueness_of :winners,:users,case_sensitive:false

    #validates :winner_ids,length:{maximum:2}

    scope :online_rooms,-> {where(online:true).order(created_at: :desc)}

    def self.denetle
        Room.where("last_activity_at < ?",1.hours.ago).update_all(online:false)
    end
end
