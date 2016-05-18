class TasksController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @active_tasks = @user.tasks.active.order('expected_end_date ASC')
    @completed_tasks = @user.tasks.completed.order("actual_end_date DESC")
    @deleted_tasks = @user.tasks.deleted.order("updated_at DESC")
    @uncompleted_tasks = @user.tasks.uncompleted
  end

  def new
    @task = Task.new
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

    if params[:task][:completed]
      attribute = "completed"
      @task.completed = params[:task][:completed]
      @task.actual_end_date = Time.now
    end
    if params[:task][:deleted]
      attribute = "deleted"
      @task.update(deleted: params[:task][:deleted])
      @task.deletion_date = Time.now
    end

    if @task.save
      flash[:notice] = "Task successfully #{attribute}."
    else
      flash[:alert] = "Something went wrong. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      flash.now[:alert] = "You cannot delete this task. It's someone else property."
    else
      flash[:notice] = "Task permanently deleted."
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
