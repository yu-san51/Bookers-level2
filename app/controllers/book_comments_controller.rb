class BookCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		comment = current_user.book_comments.new(book_comment_params)
		comment.book_id = book.id
		comment.save
		redirect_to book_path(book.id)
	end

	def destroy
		book = Book.find(params[:book_id])
		comment = current_user.comments.find(params[:id])
		comment.destroy
		redirect_to book_path(book.id)
	end

	private
	def book_comment_params
		params.require(:book_comment).permit(:comment, :book_id)
	end

end
