class UsersController < ApplicationController

before_action :correct_user, only: [:edit, :update]

  def index
    @users = User.all
    @newbook = Book.new
    @edituser = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books.find_by(params[:id])
    @books = @user.books
    @newbook = Book.new
    @edituser = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to user_path(current_user.id) unless @user == current_user
  end

end