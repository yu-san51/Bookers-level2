class FavoritesController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.new(book_id: book.id)
		favorite.save
		if path[:action] == "show"
			redirect_to book_path(book.id)
		else
			redirect_to books_path
		end
	end

	def destroy
		book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: book.id)
		favorite.destroy
		if path[:action] == "show"
			redirect_to book_path(book.id)
		else
			redirect_to books_path
		end
	end


	private
	def path
		Rails.application.routes.recognize_path(request.referer)
	end
end
