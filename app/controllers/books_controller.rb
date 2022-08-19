class BooksController < ApplicationController

before_action :correct_user, only: [:edit, :update]

  def index
    @books = Book.all
    @newbook = Book.new
    @book = @newbook
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    @book = @newbook
    if @newbook.save
      redirect_to book_path(@newbook.id), notice: 'You have created book successfully.'
    else
      @books = Book.all
      @newbook = Book.new(book_params)
      @user = current_user
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    @user = @book.user
    redirect_to "/books" unless @user == current_user
  end

end