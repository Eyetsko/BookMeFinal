class RentalsController < ApplicationController
  before_action :set_book, only: [:new, :create, :edit, :update]

  def index
    @rentals = Rental.where(user_id: current_user.id).where('end_date >= ?', Date.today)
  end

  def new
    @rental = Rental.new
  end

  def create
    start_date = params[:rental][:start_date].split(" to ")[0]
    end_date = params[:rental][:start_date].split(" to ")[1]
    @rental = Rental.new(start_date: start_date, end_date: end_date)
    @rental.book = @book
    @rental.user = current_user
    if @rental.save!
      redirect_to rentals_path, notice: "Your book is rented!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @rental = Rental.find(params[:id])
    @book = @rental.book
    @rental.user = current_user
  end

  def update
    start_date = params[:rental][:start_date].split(" to ")[0]
    end_date = params[:rental][:start_date].split(" to ")[1]
    @rental = Rental.find(params[:id])
    if @rental.update(start_date: start_date, end_date: end_date)
      redirect_to rentals_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_status
    @rentals = Rental.find(params[:id])
    if @rentals.update(rental_params)
      redirect_to rentals_path
    else
      render :edit, status: :unprocessable_entity
    end

  end

  private

  def rental_params
    params.require(:rental).permit(:status, :book_id)
  end

  def set_book
    @book = Book.find(params[:book_id])
  end
end
