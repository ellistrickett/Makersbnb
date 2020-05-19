require 'pg'
  p "Setting up test database..."
def setup_test_database

  connection = PG.connect(dbname: 'makersbnb_test')

  # Clear the users table
  connection.exec("TRUNCATE users, space, booking;")
end
