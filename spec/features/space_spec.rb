feature 'add space to MakersBnB' do
  scenario 'able to add space' do
    visit('/makersbnb')
    click_button 'Add Space'
    expect(current_path).to eq '/makersbnb/add-space'
    expect(page).to have_content 'Add New Space'
  end



end