require_relative '../web_helper'

feature 'registration' do
  scenario 'a user can sign up' do
    sign_up
    expect(page).to have_content "Please log in"
  end
end
