require 'rails_helper'

feature 'Logined user tasks actions' do
  background { log_in_user }

  given!(:plan) { create(:plan, user: @user) }
  given!(:task) { create(:task, plan_id: plan.id) }

  before do
    visit plan_tasks_path(plan)
    click_on 'Mark as executed'
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

  scenario 'created tasks must be ordered by date', js: true do
    click_on 'New task'
    fill_in 'Text', with: 'Test task'
    select '2016', from: 'Date'
    click_on 'Create Task'
    expect(page).to have_content 'Test task'
    expect(find(".tasks").first("div")[:id]).to eq('2') # Expect second task will be showed first
  end

  scenario 'full/short form', js: true do
    click_on 'Short form'
    expect(page).to_not have_content('Date')
    click_on 'Full form'
    expect(page).to have_content('Date')
  end

  scenario 'form for new/edit - open/close', js: true do
    expect(page).to have_selector('#form', visible: false)
    click_on 'New task'
    expect(page).to have_content 'Close form'
    expect(page).to have_selector('#form', visible: true)
    click_on 'Close form'
    expect(page).to_not have_content 'Close form'
    expect(page).to have_selector('#form', visible: false)
  end
end
