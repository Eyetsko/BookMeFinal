# before_action :set_book, only: [:new, :create]

class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def new
    @book = Book.find(params[:book_id])
    # @rental.book = @book
    # @rental.user = current_user
    @rental = Rental.new
  end

  def create
    @book = Book.find(params[:book_id])
    start_date = params[:rental][:start_date].split(" to ")[0]
    end_date = params[:rental][:start_date].split(" to ")[1]
    @rental = Rental.new(start_date: start_date, end_date: end_date)
    @rental.book = @book
    @rental.user = current_user
    if @rental.save!
      redirect_to rentals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:book_id)
  end

  # def set_book
  #   @book = Book.find(params[:book_id])
  # end
end
