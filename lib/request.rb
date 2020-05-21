require 'pg'
require_relative 'connect_to_database'

class Request

  def self.request_space(user_id:, space_id:, date:)
    connect_to_database.exec("INSERT INTO requests (user_id, space_id, date, status) VALUES('#{user_id}', '#{space_id}', '#{date}', 'Pending');")
  end

  def self.view_request_space
    connect_to_database.exec("SELECT * FROM requests")
  end

  def self.approve_space(user_id:, space_id:)
    connect_to_database.exec("UPDATE requests SET status = 'Request Approved' WHERE user_id = '#{user_id}' AND space_id = '#{space_id}';")
  end

  def self.decline_space(user_id:, space_id:)
    connect_to_database.exec("UPDATE requests SET status = 'Request Declined' WHERE user_id = '#{user_id}' AND space_id = '#{space_id}';")
  end

end
