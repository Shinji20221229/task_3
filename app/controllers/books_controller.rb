class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path
  end

  def index
    @book = Book.all
  end

  def show
    @book = book.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to '/book'
  end

   private

  def post_image_params
    params.require(:book).permit(:title, :caption)
  end

end
