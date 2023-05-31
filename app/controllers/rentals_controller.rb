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
    @rental = Rental.new(rental_params)
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
    params.require(:rental).permit(:start_date, :end_date, :book_id, :user_id)
  end

  # def set_book
  #   @book = Book.find(params[:book_id])
  # end
end
