require 'rails_helper'

feature 'Logined user denied actions' do
  background { log_in_user }

  given!(:plan) { create(:plan, user: @user) }
  given!(:anower_user) { create(:user, username: 'Anower name') }
  given!(:anower_plan) { create(:plan, name: 'Another plan', user: anower_user) }

  scenario 'user can`t see another users plans' do
    expect(page).to_not have_content 'Another plan'
  end
end
