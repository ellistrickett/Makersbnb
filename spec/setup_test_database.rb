require 'pg'

def setup_test_database
  connect_to_database = PG.connect dbname: 'makersbnb_test'

  connect_to_database.exec("TRUNCATE space;")
end