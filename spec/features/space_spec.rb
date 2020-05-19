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
    fill_in 'name', with: 'Room'
    fill_in 'description', with: 'Room Description'
    fill_in 'price', with: 50.00
    fill_in 'dates_available', with: '01.01'
    click_button 'Add Space'
    expect(current_path).to eq '/makersbnb'
    expect(page).to have_content 'Room Description'
  end
end
