class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end

  def googleAuth
    # Get access tokens from the google server
    user = User.from_omniauth(auth)
    log_in(user)
    # Access_token is used to authenticate request made from the rails application to the google server
    # user.google_token = auth.credentials.token
    # Refresh_token to request new auth
    # Note: Refresh_token is only sent once during the first request
    refresh_token = auth.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    redirect_to root_path
    # byebug
    # @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #   u.name = auth['info']['name']
    #   u.email = auth['info']['email']
    #   u.image = auth['info']['image']
    # end
    #
    # session[:user_id] = @user.id
    #
    # render 'welcome/home'
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
