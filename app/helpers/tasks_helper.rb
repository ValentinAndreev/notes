module TasksHelper
  def task_status(plan,task)
    if task.status
      { status: 'Executed', link_name: 'Mark as not executed', path: not_executed_path(plan, task) }
    else
      { status: 'Not executed', link_name: 'Mark as executed', path: executed_path(plan, task) }
    end
  end
end