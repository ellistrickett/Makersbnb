require_relative 'connect_to_database'

class User

  attr_reader :user_id, :real_name, :email, :password

  def initialize(user_id:, real_name:, email:, password:)
    @user_id = user_id
    @real_name = real_name
    @email = email
    @password = password
  end

  def self.create(real_name:, email:, password:)
    result = connect_to_database.exec("INSERT INTO users (email, password, real_name) VALUES ('#{email}', '#{password}', '#{real_name}') RETURNING user_id, email, password, real_name;")
    User.new(user_id: result[0]['user_id'], real_name: result[0]['real_name'], email: result[0]['email'], password: result[0]['password'])
  end

  def self.login(email:, password:)
    match = connect_to_database.exec("SELECT * FROM users WHERE email='#{email}';")

    if match.any? && match[0]['password'] == password
      User.new(user_id: match[0]['user_id'], real_name: match[0]['real_name'],  email: match[0]['email'], password: match[0]['password'])
    else
      "Failure!"
    end
  end

end
