
<<<<<<< HEAD:spec/features/_booking_helper.rb
def add_reserve
  visit('/makersbnb/add-space')
=======
def add_request
  click_on 'Add Space'
>>>>>>> website:spec/features/_request_helper.rb
  fill_in 'name', with: 'Room'
  fill_in 'description', with: 'Room Description'
  fill_in 'price', with: 50.00
  select 'March', from: 'start_month'
  select '1', from: 'start_day'
  select 'April', from: 'start_month'
  select '1', from: 'start_day'
  click_button 'Add Space'
end
