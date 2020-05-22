require 'pg'

class Space

  def self.add_space(user_id:, space_name:, description:, price:, dates_available:)
    days_array = helper_days_available_space(dates_available)
    space_name.sub! "'", "''"
    description.sub! "'", "''"
    connect_to_database.exec("INSERT INTO space (user_id, space_name, description, price, dates_available) VALUES('#{user_id}', '#{space_name}', '#{description}', '#{price}', '#{days_array}');")
  end

  def self.view_spaces
    connect_to_database.exec("SELECT * FROM space")
  end

  def self.delete_space(id:)
    connect_to_database.exec("DELETE FROM space WHERE id = #{id}")
  end

  private

  def self.connect_to_database
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect dbname: 'makersbnb_test'
    else
      PG.connect dbname: 'makersbnb'
    end
  end

  def self.helper_days_available_space(dates_available)
    array_of_dates_available = []
    to_array = dates_available.split(',')
    day_from = Date.parse(to_array[0])
    day_to = Date.parse(to_array[1])
    array_of_days = (day_from..day_to).to_a
    array_of_days.each do |day|
      array_of_dates_available << day.strftime('%a %d %b %Y')
    end
    array_of_dates_available
  end

end
