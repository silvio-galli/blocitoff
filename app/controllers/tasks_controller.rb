class TasksController < ApplicationController
  def new
    @task = Task.new
    @user = User.find(session[:user_id])
  end

  def create
    @task = Task.new(task_params)
    @task.update(user_id: session[:user_id])
    if @task.save
      flash[:notice] = "Your new task has been successfully created!"
      redirect_to user_path(@task)
    else
      flash[:alert] = "There was an error. No task created. Please try again."
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :notes, :expected_end_date, :user_id)
  end
end
