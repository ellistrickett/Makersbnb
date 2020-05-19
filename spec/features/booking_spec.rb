require_relative '../web_helper'

feature 'book space' do

  scenario 'user can request a space' do
    sign_up
    log_in
    add_booking
    click_button 'Book Space'
    fill_in 'booking_date', with: '010212'
    click_button 'Book Space'
  end

  scenario 'user can access booking page' do
    sign_up
    log_in
    add_booking
    click_button 'Book Space'
    expect(page).to have_content 'Book a space'
  end

end
