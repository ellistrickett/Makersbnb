def sign_up
  visit '/'
  fill_in('name', with: 'Test')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end

def log_in
  visit('/login')
  fill_in('email', with: 'test@example.com')
  fill_in('password', with: 'password123')
  click_button('Submit')
end


def sign_up_customer
  visit '/'
  fill_in('name', with: 'Andrew')
  fill_in('email', with: 'andrew@andrew.com')
  fill_in('password', with: 'andrew123')
  click_button('Submit')
end

def log_in_customer
  visit('/login')
  fill_in('email', with: 'andrew@andrew.com')
  fill_in('password', with: 'andrew123')
  click_button('Submit')
end
