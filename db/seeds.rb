oda = Room.new do |room|
	room.rules = "Deneme"
	room.online = true
	room.password = "a"
	room.room_id = 22
end

oda.creator = User.find_by(role:"janitor")

oda.winner = User.find_by(role:"player")

oda.users << User.where("role = ?","player") 

oda.save