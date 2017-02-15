require 'rails_helper'

feature 'Logined user actions' do   
  log_in_user!
  given!(:plan) { create(:plan, user: @user) }
  given!(:task) { create(:task, plan_id: plan.id) }

  scenario 'users logout' do
    click_on 'Logout'
    expect(page).to have_content 'Hello, you must register or login to continue.'      
  end
  
  scenario 'user can create plans', js: true do
    click_on 'New plan'
    fill_in 'Name', with: 'Test plan'
    click_on 'Create Plan'
    expect(page).to have_content 'Test plan'
  end 

  scenario 'user can edit name of plan', js: true do
    visit root_path
    click_on 'Edit name'
    fill_in 'Name', with: 'Test plan edited'
    click_on 'Update Plan'
    expect(page).to have_content 'Test plan edited'
  end 

  scenario 'user can delete plan', js: true do
    visit root_path
    click_on 'Delete'
    expect(page).to_not have_content 'Factory plan'
  end 

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
    expect(page).to_not have_content 'Text'
  end 

  scenario 'task mark as executed', js: true do
    visit plan_tasks_path(plan)
    click_on 'Mark as executed'
    expect(page).to have_content 'Executed'
    expect(page).to have_selector('#task-executed')
    expect(page).to_not have_selector('#task-not-executed')
  end  

  scenario 'task mark as not executed', js: true do
    visit plan_tasks_path(plan)
    click_on 'Mark as executed'
    click_on 'Mark as not executed'
    expect(page).to_not have_selector('#task-executed')
    expect(page).to have_selector('#task-not-executed')
  end
end