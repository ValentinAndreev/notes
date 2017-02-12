class PlansController < ApplicationController
  before_action :set
  before_action :require_login

  def index
    @plans = current_user.plans.all
    respond_to do |format|
      format.html
      format.js
    end    
  end

  def show
  end

  def new
    @plan = current_user.plans.new
  end

  def create
    @plan = current_user.plans.create!(plan_params)
  end

  def edit
  end

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
  
  def require_login
    redirect_to '/' unless current_user
  end

  def plan_params
    params.require(:plan).permit(:name)
  end

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end
