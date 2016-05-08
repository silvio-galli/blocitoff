class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @tasks = @user.tasks
  end
end
