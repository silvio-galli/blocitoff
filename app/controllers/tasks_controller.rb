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
    @user = User.find(session[:user_id])
    @task= Task.find(params[:id])

    if params[:task][:completed]
      attribute = "completed"
      @task.actual_end_date = Time.now
      @task.completed = params[:task][:completed]
    end
    if params[:task][:deleted]
      attribute = "deleted"
      @task.update(deleted: params[:task][:deleted])
      # I need this call to the database to set updated_at field at the time of deletion,
      # because I use updated_at to calculate how many hours/days have passed from creation to deletion
    end

    if @task.save
      flash[:notice] = "Task successfully #{attribute}."
      # redirect_to user_path(@task)
    else
      flash[:alert] = "Something went wrong. Please try again."
      # redirect_to user_path(@task)
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :notes, :expected_end_date, :user_id)
  end

end
