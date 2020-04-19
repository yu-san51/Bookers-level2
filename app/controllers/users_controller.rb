class UsersController < ApplicationController

before_action :correct_user, only: [:edit, :update]

  def index
  	@users = User.all
  	@user = current_user
  	@create_book = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
    @create_book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
  	if user.update(user_params)
  	  redirect_to user_path(user.id)
      flash[:notice] = "You have updated user successfully."
    else
      @user = user
      render :edit
    end
  end


    #フォロー詳細画面
  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render "show_follow"
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render "show_follower"
  end




  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    user = User.find(params[:id])
    if current_user != user
      redirect_to user_path(current_user.id)
    end
  end


end

