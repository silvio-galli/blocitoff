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

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task= Task.find(params[:id])
    if params[:completed]
      @task.completed = params[:completed]
      if @task.save
        flash[:notice] = "Task marked as completed."
        redirect_to user_path(@task)
      else
        flash[:alert] = "Task was not marked as completed. Please try again."
        redirect_to user_path(@task)
      end
    end
    if params[:deleted]
      @task.completed = params[:deleted]
      if @task.save
        flash[:notice] = "Task successfully deleted."
        redirect_to user_path(@task)
      else
        flash[:alert] = "Something went wrong. Please try again."
        redirect_to user_path(@task)
      end
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :notes, :expected_end_date, :user_id)
  end
end
