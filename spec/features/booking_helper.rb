


def add_booking
  click_on 'Add Space'
  fill_in 'name', with: 'Room'
  fill_in 'description', with: 'Room Description'
  fill_in 'price', with: 50.00
  fill_in 'dates_available', with: '01.01'
  click_button 'Add Space'
end
