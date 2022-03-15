class RoomsController < ApplicationController
	before_action :select_room,only: %i[ update show edit join ]
	
	before_action only:%i[ edit update ] do
		@max_users = @room.tip == "takımlı" ? 4 : @room.tip == "eşli" ? 2 : 1
	end

	before_action only:%i[ index show ] do
		Room.denetle
	end
	def index
		@rooms = Room.online_rooms
	end
	def new
		redirect_to("/") unless current_user.role == "janitor"
		@room = Room.new
	end
	def create
		@room = Room.new(params.require(:room).permit!)

		@room.creator = current_user
		@room.online = true

		if @room.save
			flash[:notice] = "Oda başarıyla açıldı,Lütfen kurallara uyun"
			@room.update_column(:last_activity_at,@room.created_at)
			redirect_to(@room)
		else
			flash[:error] = @room.errors.full_messages
			redirect_to(new_room_path)
		end
	end

	def edit 
		unless creator_account(@room) && @room.online
			redirect_to(room_path(@room))
		end
	end

	def update
		if params[:winners].size == @max_users
			params[:winners].each do |i| 
				if @room.users.include?(User.find_by_username(i)) && current_user.role == "janitor"
					@room.winners << User.find_by_username(i) 
				end
			end		

			#@room.update(params.require(:room).permit(:video))
		
			#@room.update_column(:online,false)
		
			redirect_to("/")
			# TODO buraya api hizmetine gönderilecek sonucu eklenecek
			# TODO HTTParty.post ile gönder
		else
			redirect_to(edit_room_path(@room.id))
		end
	end

	def show

	end
	def join
		if control_room(@room) && @room.creator != current_user && @room.online && current_user.role == "player"
			@room.users << current_user
			redirect_to(show_password_path)
		else
			redirect_to(room_path(@room))
		end
	end

	def show_password
		if Room.find(params[:id]).users.include?(current_user) && current_user.role == "player"
			@data = Room.find(params[:id])
		else
			redirect_to(room_path(params[:id]))
		end
	end

	private

	def select_room
		@room = Room.find(params[:id])
	end
end