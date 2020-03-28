class UsersController < ApplicationController

  def index
  	@users = User.all
  	@user = current_user.id
  	@book = Book.new

  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books.user_id
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	if user.update(user_params)
  	  redirect_to user_path(@user.id)
    else
      render
    end
  end



  	private
  		def user_params
  			params.require(:user).permit(:name, :introduction, :profile_image)
  		end
end
