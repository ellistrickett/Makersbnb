require_relative '../web_helper'

feature 'add space to MakersBnB' do
  scenario 'able to reach form to add space' do
    sign_up
    log_in
    visit('/makersbnb')
    click_button 'Add Space'
    expect(current_path).to eq '/makersbnb/add-space'
    expect(page).to have_content 'Add New Space'
  end

  scenario 'able to add space' do
    sign_up
    log_in
    visit('/makersbnb/add-space')
    add_booking
    expect(current_path).to eq '/makersbnb'
    expect(page).to have_content 'Room Description'
  end
end
