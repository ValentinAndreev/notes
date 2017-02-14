module PlansHelper
  def plan_tasks(plan)
    plan.tasks.count
  end
end
