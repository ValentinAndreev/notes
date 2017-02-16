require 'rails_helper'

feature 'Logined user tasks crud actions' do
  background { log_in_user }

  given!(:plan) { create(:plan, user: @user) }
  given!(:task) { create(:task, plan_id: plan.id) }

  scenario 'user can create tasks', js: true do
    visit plan_tasks_path(plan)
    click_on 'New task'
    fill_in 'Text', with: 'Test task'
    click_on 'Create Task'
    expect(page).to have_content 'Test task'
  end

  scenario 'user can edit tasks', js: true do
    visit plan_tasks_path(plan)
    click_on 'Edit'
    fill_in 'Text', with: 'Test task edited'
    click_on 'Update Task'
    expect(page).to have_content 'Test task edited'
  end

  scenario 'user can delete tasks', js: true do
    visit plan_tasks_path(plan)
    click_on 'Delete'
    expect(page).to_not have_content 'another text'
  end
end
