class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    flash[:notice] = "You've been signed in with your #{current_user.provider.capitalize} account."
    redirect_to root_path
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
