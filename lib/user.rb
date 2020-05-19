class User

  attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end

  def self.create(name:, email:, password:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'makersbnb_test')
    else
      connection = PG.connect(dbname: 'makersbnb')
    end

    result = connection.exec("INSERT INTO users (email, password, real_name) VALUES ('#{email}', '#{password}', '#{name}') RETURNING user_id, email, password, real_name;")
    User.new(id: result[0]['user_id'], name: result[0]['real_name'], email: result[0]['email'], password: result[0]['password'])

  end

end
