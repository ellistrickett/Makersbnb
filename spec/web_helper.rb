def sign_up
  visit '/users/new'
  fill_in('name', with: 'Test')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end