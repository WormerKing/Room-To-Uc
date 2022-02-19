class RoomsController < ApplicationController
	before_action :select_room,only: %i[ show edit join ]
	def index
		@rooms = Room.online_rooms
	end
	def new
		@room = Room.new
	end
	def create
		@room = Room.new(params.require(:room).permit!)

		@room.creator = current_user
		@room.winner = current_user

		if @room.save
			flash[:notice] = "Oda başarıyla açıldı,Lütfen kurallara uyun"
			redirect_to(@room)
		else
			flash[:error] = "Oda oluşturmada hata meydana geldi"
			render :new
		end
	end
	def update

	end
	def show

	end
	def join
		if control_room
			@room.users << current_user
			redirect_to(show_password_path)
		else
			redirect_to(room_path(@room))
		end
	end

	def show_password
		if Room.find(params[:id]).users.include?(current_user)
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