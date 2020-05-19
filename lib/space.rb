require 'pg'

class Space 

  def self.add_space(space_name:, description:, price:, dates_available:)
    connect_to_database.exec("INSERT INTO space (space_name, description, price, dates_available) VALUES('#{space_name}', '#{description}', '#{price}', '#{dates_available}');")
  end

  private

  def self.connect_to_database
    if ENV['ENVIROMENT'] == 'test'
      PG.connect dbname: 'makersbnb_test'
    else
      PG.connect dbname: 'makersbnb'
    end
  end

end