class TasksController < ApplicationController
  before_action :new

  def index
    @tasks = Task.all
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def new
    @task = Task.new     
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.create!(task_params)
  end

  def update
    @task = Task.find(params[:id])
    @task.update_attributes!(task_params)
  end

  def destroy
    @task = Task.destroy(params[:id])    
  end

  private

  def task_params
    params.require(:task).permit(:text, :date, :status)
  end
end
