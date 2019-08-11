class UsersController < ApplicationController
  layout "session"
  before_action :set_user, only: [:edit, :update, :destroy]

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end

  def new
    @user = User.new
  end

  def create #sign up new users
    @user = User.new(user_params)
    if @user.save
      log_in(@user) #sets session id for user
      redirect_to itineraries_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy
    @current_user = nil
    redirect_to root_url
  end

  private

  def set_user
    @user = User.find(session[:user_id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,:password_confirmation)
  end
end
