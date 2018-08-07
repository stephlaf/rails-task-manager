class TasksController < ApplicationController

  before_action :fetch_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    # @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(title: params[:task][:title], details: params[:task][:details])
    @task.save
    # raise
    redirect_to task_path(@task)
  end

  def edit
    # @task = Task.find(params[:id])
  end

  def update
    # @task = Task.find(params[:id])
    @task.update(title: params[:task][:title], details: params[:task][:details], completed: params[:task][:completed])
    
    redirect_to task_path(@task)
  end

  def destroy
    # @task = Task.find(params[:id])
    @task.destroy
    
    redirect_to tasks_path
  end

  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def fetch_task
    @task = Task.find(params[:id])
  end

end

















