require 'rails_helper'

feature 'Logined user plan actions' do
  background { log_in_user }

  given!(:plan) { create(:plan, user: @user) }
  given!(:task) { create(:task, plan_id: plan.id) }

  background { visit root_path }

  scenario 'user can create plans', js: true do
    click_on 'New plan'
    fill_in 'Name', with: 'Test plan'
    click_on 'Create Plan'
    expect(page).to have_content 'Test plan'
  end

  scenario 'user can edit name of plan', js: true do
    click_on 'Edit name'
    fill_in 'Name', with: 'Test plan edited'
    click_on 'Update Plan'
    expect(page).to have_content 'Test plan edited'
  end

  scenario 'user can delete plan', js: true do
    click_on 'Delete'
    expect(page).to_not have_content 'Factory plan'
  end

  scenario 'form for new/edit - open/close', js: true do
    expect(page).to have_selector('#form', visible: false)
    click_on 'New plan'
    expect(page).to have_content 'Close form'
    expect(page).to have_selector('#form', visible: true)
    click_on 'Close form'
    expect(page).to_not have_content 'Close form'
    expect(page).to have_selector('#form', visible: false)
  end
end
