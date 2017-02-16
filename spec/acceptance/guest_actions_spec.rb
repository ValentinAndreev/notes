require 'rails_helper'

feature 'Guests actions' do
  before do
    visit root_path
  end

  scenario 'guest must see invitation to registration' do
    expect(page).to have_content 'Hello, you must register or login to continue.'
  end

  scenario 'guest can register' do
    click_on 'Sign up'
    expect(page).to have_current_path(new_user_path)
  end

  scenario 'guest can log in' do
    click_on 'Log in'
    expect(page).to have_current_path(login_path)
  end

  scenario "guest can't see any plans" do
    expect(page).to_not have_content 'Plans in order of priority:'
    expect(page).to_not have_content 'New plan'
  end
end
