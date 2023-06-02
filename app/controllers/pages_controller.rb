class PagesController < ApplicationController
  def home
    @user = current_user
  end

  def profile
    @user = current_user
  end
end
