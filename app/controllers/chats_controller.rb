class ChatsController < ApplicationController

	def create
		@room = Room.find(params[:room_id])
		content = current_user.chats.new(chat_params)
		content.room_id = @room.room_id
		content.save
	end



	private
	def create
		chat_params
		params.require(:chat).permit(:content)
	end
end
