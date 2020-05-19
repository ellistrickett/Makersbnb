feature 'add space to MakersBnB' do
  scenario 'able to add space' do
    visit('/makersbnb')
    expect(page).to have_content 'Add New Space'
  end

end