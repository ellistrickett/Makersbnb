require_relative '../web_helper'

feature 'reserve space' do

  scenario 'user can access reserve page' do
    sign_up
    log_in
    add_reserve
    click_button 'Reserve Space'
    expect(page).to have_content 'Reserve a space'
  end

  scenario 'user can reserve a space' do
    sign_up
    log_in
    add_reserve
    click_button 'Reserve Space'
    click_button 'Reserve Space'
    expect(current_path).to eq '/makersbnb'
  end

end
