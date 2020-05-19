
feature 'book space' do

  scenario 'user can access booking page' do
    add_booking
    visit('/makersbnb')
    click_button 'Book Space'
    expect(current_path).to eq '/makersbnb/book-space'
    expect(page).to have_content 'Book a space'
  end

  scenario 'user can request a space' do
    add_booking
    visit('/makersbnb/book-space')
    fill_in 'booking_date', with: '010212'
    click_button 'Book Space'
  end


end
