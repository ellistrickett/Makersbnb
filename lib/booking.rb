require 'pg'

class Booking

  def self.book_space(user_id:, space_id:, date:)
    connect_to_database.exec("INSERT INTO booking (user_id, space_id, date) VALUES('#{user_id}', '#{space_id}', '#{date}');")
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
