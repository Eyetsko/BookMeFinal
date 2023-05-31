class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @rental = Rental.new
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save!
      redirect_to books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :image_url)
  end
end
