class TasksController < ApplicationController
  before_action :set_task_id, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @answer = ""
    if @task.completed
      @answer = "This task is commpleted"
    else
      @answer = "This task is not completed yet"
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def set_task_id
    @task = Task.find(params[:id])
  end

end
