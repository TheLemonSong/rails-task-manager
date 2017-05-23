class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  # New and create work together
  def new
    @task = Task.new
  end
  def create
    task_params = params.require(:task).permit(:name, :description)
    new_task = Task.create(task_params)

    redirect_to tasks_path
  end

  # Edit and update work together
  def edit
    @task = Task.find(params[:id])
  end
  def update
    # filter the params
    task_params = params.require(:task).permit(:name, :description)
    # find what task we are aalking about using url/params id
    @task = Task.find(params[:id])
    # update that task
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
end

