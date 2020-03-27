class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@create_book = Book.new
  end

  def edit
  	@user = user.find(params[:id])
  end
end
