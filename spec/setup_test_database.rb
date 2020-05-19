require 'pg'

def setup_test_database
  p "Setting up test database..."
  connection = PG.connect(dbname: 'makersbnb_test')

  # Clear the users table
  connection.exec("TRUNCATE users;")
  # connection.exec("TRUNCATE spaces;")
end
