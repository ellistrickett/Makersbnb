require 'user'

describe User do 

  it 'returns its id, name, email and password' do
    user = User.new(id: 1, name: 'Test', email: 'test@example.com', password: 'password123')
    expect(user.id).to eq(1)
    expect(user.name).to eq("Test")
    expect(user.email).to eq('test@example.com')
    expect(user.password).to eq("password123")
  end

  it 'signs up a user' do 
    User.sign_up(name: 'Test', email: 'test@example.com', password: 'password123')
    
end