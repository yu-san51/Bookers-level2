class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
	validates :title, presence:true, length: {maximum: 200}
	validates :body, presence:true, length: {maximum: 200}


	#search
	def self.search(search, word)
		if search == "forward_match"  #前方
			@books = Book.where("title LIKE?", "#{word}%")
		elsif search == "backward_match"  #後方
			@books = Book.where("title LIKE?", "%#{word}")
		elsif search == "parfect_match"  #完全
			@books = Book.where(title: "#{word}")
		elsif search == "partial_match"  #部分
			@books = Book.where("title LIKE?", "%#{word}%")
		else
			@books = Book.all
		end
	end
end
