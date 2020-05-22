

# def add_reserve
#   visit('/makersbnb/add-space')

def add_space
  click_on 'Add Space'
  fill_in 'name', with: "Andrew's Cottage"
  fill_in 'description', with: 'Room Description'
  fill_in 'price', with: 50.00
  select 'March', from: 'start_month'
  select '1', from: 'start_day'
  select 'March', from: 'end_month'
  select '5', from: 'end_day'
  click_button 'Add Space'
end
