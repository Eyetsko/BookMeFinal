class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end
  def new
    @rental = Rental.new
  end
  def create
    @rental = Rental.new(rental_params)
    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:date, :book_id, :user_id)
  end
end
