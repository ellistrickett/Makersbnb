require_relative '../web_helper'

feature 'login' do
  scenario 'a user can log in' do
    sign_up
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password123')
    click_button('Submit')

    expect(page).to have_content "Welcome, Test"
  end


end