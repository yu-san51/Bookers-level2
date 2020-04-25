class ChatsController < ApplicationController

	def show
		@chat = Chat.new
		@user = User.find(params[:id])
		rooms = current_user.user_rooms.pluck(:room_id)
		user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

		unless user_rooms.nil?
			@room = user_rooms.room
		else
			@room = Room.new
			@room.save
			UserRoom.create(user_id: current_user.id, room_id: @room.id)
			UserRoom.create(user_id: @user.id, room_id: @room.id)
		end
		@chats = @room.chats
	end

	def create
		@chat = Chat.new(chat_params)
		@chat.user_id = current_user.id
		@chat.save!
		@user = @chat.sent_id.to_i
		redirect_to chat_path(@user)
	end



	private
	def chat_params
		params.require(:chat).permit(:content, :room_id, :sent_id)
	end
end
