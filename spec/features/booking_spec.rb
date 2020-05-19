
feature 'book space' do

  scenario 'user can access booking page' do
    add_booking
    visit('/makersbnb')
    click_button 'Book Space'
    expect(current_path).to eq '/makersbnb/book-space'
    expect(page).to have_content 'Book a space'
  end


end
