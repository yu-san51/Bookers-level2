class UserRoom < ApplicationRecord
	belongs_to :user
	belongs_to :room, class_name: "User"

	validates :user_id, presence: true
	validates :room_id, presence: true
end
