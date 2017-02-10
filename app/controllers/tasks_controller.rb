class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create!(task_params)
    redirect_to tasks_path
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task = Task.destroy(params[:id])
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:text, :date, :status)
  end
end
