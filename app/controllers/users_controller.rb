class UsersController < ApplicationController
  # before_action :set_user, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    return redirect_to controller: 'sessions', action: 'new' unless @user.save
    session[:user_id] = @user.id
    redirect_to controller: 'user', action: 'show'
  end

  def show
  end

  private
  # def set_user
  #   @user = User.find(params[:id])
  # end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
