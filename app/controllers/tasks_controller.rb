class TasksController < ApplicationController
  before_action :set

  def index
    @tasks = @plan.tasks.all.order(:date)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def executed
    @task.update_attributes!(status: true)
  end

  def not_executed
    @task.update_attributes!(status: false)
  end

  def new
    @task = @plan.tasks.new
  end

  def edit; end

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
    params.require(:task).permit(:text, :date, :status, :plan_id, :order)
  end
end
