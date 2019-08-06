class UsersController < ApplicationController

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def new
    @user = User.new
  end

  def create #signs up new users
    @user = User.new(user_params)
    # byebug
    if @user.save
      log_in(@user) #sets session id for user
      # flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
