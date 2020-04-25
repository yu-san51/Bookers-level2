class Chat < ApplicationRecord
	belongs_to :room
	belongs_to :user

	validates :content, presence: :true
	attr_accessor :sent_id
end
