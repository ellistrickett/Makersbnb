require_relative '../web_helper'

feature 'login' do
  scenario 'a user can log in' do
    sign_up
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, Test"
  end

  scenario 'enters wrong details' do 
    sign_up
    fill_in('email', with: 'qwertyuiop')
    fill_in('password', with: 'qwertyuiop')
    click_button('Submit')

    expect(page).to have_content "* You entered incorrect details, please try again!"
  end
end