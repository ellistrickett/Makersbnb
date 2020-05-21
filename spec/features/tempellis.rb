require_relative '../web_helper'

feature 'request' do
  scenario 'a user can view their requests' do
    sign_up
    log_in
    click_link('View Requests')
    expect(page).to have_content("Your requests:")
  end
end
