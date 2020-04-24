class Chat < ApplicationRecord
	belongs_to :room
	belongs_to :user
	belongs_to :user_rooms

	validates :chat, presence: :true
end
