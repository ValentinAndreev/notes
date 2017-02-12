class TasksController < ApplicationController
  before_action :set

  def index
    @tasks = @plan.tasks.all
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def new
    @task = @plan.tasks.new
  end

  def edit
  end

  def create
    @task = @plan.tasks.new(task_params)
    @task.user_id = current_user.id
    @task.save!
  end

  def update
    @task.update_attributes!(task_params)
  end

  def destroy
    @task.destroy
  end

  private

  def set
    @plan = current_user.plans.find(params[:plan_id]) if params[:plan_id]
    @task = @plan.tasks.find(params[:id]) if params[:id] && @plan
  end

  def task_params
    params.require(:task).permit(:text, :date, :status, :plan_id)
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
