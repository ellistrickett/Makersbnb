require 'pg'

class Space 

  def self.add_space(user_id:, space_name:, description:, price:, dates_available:)
    connect_to_database.exec("INSERT INTO space (user_id, space_name, description, price, dates_available) VALUES('#{user_id}', '#{space_name}', '#{description}', '#{price}', '#{dates_available}');")
  end

  def self.view_spaces
    connect_to_database.exec("SELECT * FROM space")
  end

  private

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect dbname: 'makersbnb_test'
    else
      PG.connect dbname: 'makersbnb'
    end
  end

end