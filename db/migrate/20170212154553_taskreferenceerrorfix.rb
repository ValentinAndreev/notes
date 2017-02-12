class Taskreferenceerrorfix < ActiveRecord::Migration[5.0]
  def change
    remove_reference :tasks, :plans
    add_reference :tasks, :plan
  end
end
