class Log < ApplicationRecord
  belongs_to :room,class_name:"Room",foreign_key:"room_id"
end
