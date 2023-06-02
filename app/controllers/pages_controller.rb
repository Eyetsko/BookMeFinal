class PagesController < ApplicationController
  def home
    @user = current_user
  end

  def profile
    @user = current_user
    @rentals = Rental.where(user_id: current_user.id).where('end_date >= ?', Date.today)
  end
end
