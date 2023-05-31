class RentalsController < ApplicationController
  before_action :set_book, only: [:new, :create, :edit, :update]

  def index
    @rentals = Rental.where(user_id: current_user.id).where('end_date >= ?', Date.today)
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.book = @book
    @rental.user = current_user
    if @rental.save!
      redirect_to rentals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @rental = Rental.where(user_id: current_user.id).find(params[:book_id])
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :book_id, :user_id)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
