class HomeController < ApplicationController
  def welcome
    redirect_to plans_path if current_user
  end
end
