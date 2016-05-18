class UsersController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @tasks = @user.tasks
    @active_tasks = @user.tasks.active.order('expected_end_date ASC')
    @completed_tasks = @user.tasks.completed.order("actual_end_date DESC")
    @deleted_tasks = @user.tasks.deleted.order("updated_at DESC")
    @uncompleted_tasks = @user.tasks.uncompleted
  end
end
