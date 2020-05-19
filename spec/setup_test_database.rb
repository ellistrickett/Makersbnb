require 'pg'

def setup_test_database
<<<<<<< HEAD
  p "Setting up test database..."
  connection = PG.connect(dbname: 'makersbnb_test')

  # Clear the users table
  connection.exec("TRUNCATE users;")
  # connection.exec("TRUNCATE spaces;")
end
=======
  connect_to_database = PG.connect dbname: 'makersbnb_test'

  connect_to_database.exec("TRUNCATE space;")
end
>>>>>>> space
