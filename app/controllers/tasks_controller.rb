class TasksController < ApplicationController
  def new
    @task = Task.new
    @user = User.find(session[:user_id])
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    if @task.save
      flash[:notice] = "Your new task has been successfully created!"
      redirect_to user_path(@task)
    else
      flash[:alert] = "There was an error. No task created. Please try again."
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task= Task.find(params[:id])
=begin
    if params[:task][:notes]
      @task.notes = params[:task][:notes]
    end
    if params[:task][:completed]
      @task.completed = params[:task][:completed]
    end
    if params[:task][:deleted]
      @task.deleted = params[:task][:deleted]
    end
=end
    @task.assign_attributes(update_task_params)
    if @task.save
      flash[:notice] = "Task successfully updated."
      redirect_to user_path(@task)
    else
      flash[:alert] = "Something went wrong. Please try again."
      redirect_to user_path(@task)
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :notes, :expected_end_date, :user_id)
  end

  def update_task_params
    params.require(:task).permit(:completed, :deleted)
  end
end
