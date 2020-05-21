class Request

  def self.approve_space(id:)
    connect_to_database.exec("UPDATE booking SET requests = 'Booking Confirmed' WHERE space_id = #{id};")
  end

  def self.decline_space(id:)
    connect_to_database.exec("UPDATE booking SET requests = 'Booking Declined' WHERE space_id = #{id};")
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