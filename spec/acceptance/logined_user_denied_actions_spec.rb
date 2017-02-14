require 'rails_helper'

feature 'Logined user denied actions' do   
  log_in_user!
  let!(:plan) { create(:plan, user: @user) }   
  let!(:anower_user) { create(:user, username: 'Anower name') } 
  let!(:anower_plan) { create(:plan, name: 'Another plan', user: anower_user) }  
    
  scenario 'user can`t see another users plans' do
    expect(page).to_not have_content 'Another plan'          
  end 
end