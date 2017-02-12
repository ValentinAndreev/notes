class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      User.authenticate(@user.username, @user.password)
      session[:user_id] = @user.id
      redirect_to '/', notice: 'Welcome! Your account was created.'
    else
      redirect_back(fallback_location: '/', notice: @user.errors)
    end
  end

private
  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end