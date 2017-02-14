module SpecMacros
  def log_in_user!
    before do
      @user = create(:user) 
      visit login_path 
      fill_in 'Username', with: @user.username
      fill_in 'Password', with: @user.password  
      click_on 'Enter'
      expect(page).to have_content 'Hi ' + @user.username
    end
  end
end