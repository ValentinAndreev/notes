class PlansController < ApplicationController
  before_action :require_login
  before_action :set

  def index
    @plans = current_user.plans.rank(:row_order).all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update_row_order
    @plan = current_user.plans.find(plan_params[:plan_id])
    @plan.row_order_position = plan_params[:row_order_position]
    @plan.save
    head :ok
  end

  def show; end

  def new
    @plan = current_user.plans.new
  end

  def create
    @plan = current_user.plans.create!(plan_params)
  end

  def edit; end

  def update
    @plan.update_attributes!(plan_params)
  end

  def destroy
    @plan.destroy
  end

  private

  def set
    @plan = current_user.plans.find(params[:id]) if params[:id]
  end

  def plan_params
    params.require(:plan).permit(:name, :row_order_position, :plan_id)
  end
end
