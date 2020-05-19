require 'user'

describe User do

  it 'returns its id, name, email and password' do
    user = User.new(user_id: 1, real_name: 'Test', email: 'test@example.com', password: 'password123')
    expect(user.user_id).to eq(1)
    expect(user.real_name).to eq("Test")
    expect(user.email).to eq('test@example.com')
    expect(user.password).to eq("password123")
  end

  it 'signs up a user' do
    user = User.create(real_name: 'Test', email: 'test@example.com', password: 'password123')
    expect(user).to be_a User
    expect(user.real_name).to eq 'Test'
    expect(user.email).to eq 'test@example.com'
    # expect(user.password).to eq 'password123'
  end

  it 'logs in a user' do
    User.create(real_name: 'Test', email: 'test@example.com', password: 'password123')
    user = User.login(email: 'test@example.com', password: 'password123')
    expect(user.real_name).to eq 'Test'
  end

end
