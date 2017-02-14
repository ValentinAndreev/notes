require 'rails_helper'

feature 'Users creation and login' do
  scenario 'create user' do
    visit new_user_path  
    fill_in 'Username', with: 'usere'    
    fill_in 'Password', with: 'password', match: :prefer_exact
    fill_in 'Password confirmation', with: 'password', match: :prefer_exact     
    click_on 'Create user'    
    expect(page).to have_content 'Welcome! Your account was created.'  
    expect(current_path).to eq plans_path
  end 

  log_in_user! #Macros for login with before

  scenario 'user login with wrong credentials' do
    visit login_path 
    fill_in 'Username', with: 'wrong_username'
    fill_in 'Password', with: 'wrong_password'   
    click_on 'Enter'
    expect(page).to have_content (/Invalid Username or password./i)
    expect(current_path).to eq login_path   
  end   
end