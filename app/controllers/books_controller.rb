class BooksController < ApplicationController

before_action :correct_user, only: [:edit, :update, :destroy]


	def create
		@create_book = Book.new(book_params)
		@create_book.user_id = current_user.id
		if @create_book.save
			redirect_to book_path(@create_book.id)
			flash[:notice] = "You have creatad book successfully."
		else
			@books = Book.all
			@user = current_user
			render :index
		end
	end

	def index
		@books = Book.all
		@create_book = Book.new
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@create_book = Book.new
		@book_comment = BookComment.new
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		book = Book.find(params[:id])
		if book.update(book_params)
			redirect_to book_path(book.id)
			flash[:notice] = "You have updated book successfully."
		else
			@book = book
			render :edit
		end
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def correct_user
    	book = Book.find(params[:id])
    	if current_user != book.user
      		redirect_to books_path
      	end
  	end




	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end


