class RoomsController < ApplicationController
	before_action :set_user
	def create
		room = current_user.room(@user)
		room.save
		render room_chat_path(room.id)
	end

	private
	def set_user
		@user = User.find(params[:receiver_id])
	end
end
