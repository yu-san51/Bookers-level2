class BooksController < ApplicationController

	def create
		book = Book.
	end

	def index
		@books = Book.all
	end

	def show
		@user = Book.find(params[:id])
		@book = @user
	end

	def edit
		@book = Book.find(params[:id])
	end
end
