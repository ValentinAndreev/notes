require 'rails_helper'

feature 'Logined user tasks actions' do
  background { log_in_user }

  given!(:plan) { create(:plan, user: @user) }
  given!(:task) { create(:task, plan_id: plan.id) }

  before do
    visit plan_tasks_path(plan)
    click_on 'Mark as executed'
  end

  scenario 'created tasks must be ordered by date', js: true do
    click_on 'New task'
    fill_in 'Text', with: 'Test task'
    select '2016', from: 'Date'
    click_on 'Create Task'
    expect(page).to have_content 'Test task'
    expect(find(".tasks").first("div")[:id]).to eq('2') # Expect second task will be showed first
  end

  scenario 'task mark as executed', js: true do
    expect(page).to have_content 'Executed'
    expect(page).to have_selector('#task-executed')
    expect(page).to_not have_selector('#task-not-executed')
  end

  scenario 'task mark as not executed', js: true do
    click_on 'Mark as not executed'
    expect(page).to_not have_selector('#task-executed')
    expect(page).to have_selector('#task-not-executed')
  end
end
