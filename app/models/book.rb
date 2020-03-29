class Book < ApplicationRecord
	belongs_to :user, dependent: :destroy
	attachment :profile_image
	validates :title, presence:true, length: {maximum: 200}
	validates :body, presence:true, length: {maximum: 200}
end
