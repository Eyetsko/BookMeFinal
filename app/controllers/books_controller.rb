class BooksController < ApplicationController
  def index
    @books = Book.all
    if params[:query].present?
      sql_query = "title ILIKE :query OR author ILIKE :query"
      @books = Book.where(sql_query, query: "%#{params[:query]}%")
    else
      @books = Book.all
    end

  end

  def show
    @rental = Rental.new
    @book = Book.find(params[:id])
  end

  def new
    @user = current_user
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

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy!
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author, :image_url, :synopsis)
  end
end
