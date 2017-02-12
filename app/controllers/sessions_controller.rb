class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params["/login"][:username], params["/login"][:password])
    if @user      
      session[:user_id] = @user.id
      redirect_to '/', notice: "Hi #{@user.username}!"
    else
      redirect_to login_path, notice: 'Invalid username or password.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/', notice: 'Logged out'
  end
end