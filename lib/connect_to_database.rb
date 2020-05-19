
def connect_to_database
  if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: 'makersbnb_test')
  else
     PG.connect(dbname: 'makersbnb')
  end
end
