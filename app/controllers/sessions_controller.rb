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
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url
  end

  def googleAuth
    # Get access tokens from the google server
    # Access_token is used to authenticate request made from the rails application to the google server
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      access_token = auth
      u.google_token = auth.credentials.token
      refresh_token = auth.credentials.refresh_token# Refresh_token to request new auth Note: Refresh_token is only sent once during the first request
      u.google_refresh_token = refresh_token if refresh_token.present?
      u.password = SecureRandom.urlsafe_base64
    end
    log_in(@user)
    redirect_to @user
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
