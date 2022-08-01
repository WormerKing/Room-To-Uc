class ApiController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authorized,except:%i[ login ]

	def index
		render json:{datas:Log.where(processed:true)}
	end

	def show
		@log = Log.find(params[:id])
		render json:{data:@log}
	end

	def winners
		@room = Log.find(params[:id]).room
		render json:{winners:@room.winners}
	end

	def update
		#encoded = Base64.encode64("False")
		@log = Log.find(params[:id])

		unless @log.processed
			render json: {error:"Bu odanın ödemesi zaten yapılmış"}
		else
			@log.update(processed:false)
			render json:{message:"Başarılı"}
		end
	end

	def video
		@room = Log.find(params[:id]).room

		@encode_video = Base64.encode64(@room.video.download)
		render json:{video:@encode_video}
	end

  	def login
    	@user = ApiUser.find_by(username: params[:username])

    	if @user && @user.authenticate(params[:password])
      		token = encode_token({user_id: @user.id})
      		render json: {user: @user, token: token}
    	else
      		render json: {error: "Invalid username or password"}
    	end
  	end

	# The private area ######################### 

	private
    def encode_token(payload)
        JWT.encode(payload, nil,"none")
    end

    def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
            token = auth_header.split(' ')[1]
            # header: { 'Authorization': 'Bearer <token>' }
            begin
                JWT.decode(token,nil,false)
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def logged_in_user
        if decoded_token
            user_id = decoded_token[0]['user_id']
            @user = ApiUser.find_by(id: user_id)
        end
    end

  	def logged_in?
    	logged_in_user
 	end

  	def authorized
    	render json: { message: "Please log in" }, status: :unauthorized unless logged_in?
  	end
end


