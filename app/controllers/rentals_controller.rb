require "pry-byebug"

class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    binding.pry
    @rental.user = current_user
    if @rental.save
      redirect_to rentals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:date, :book_id, :user_id)
  end
end
