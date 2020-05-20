require 'request'

describe Request do

  describe '.request_space' do

    it 'should be able to request a space' do
      Request.request_space(user_id: '1', space_id:'12', date:'010212')
      connect_to_database = PG.connect dbname: 'makersbnb_test'
      request = connect_to_database.exec("SELECT * FROM requests")

      request.each do |request_object|
        expect(request_object['user_id']).to eq '1'
        expect(request_object['space_id']).to eq '12'
        expect(request_object['date']).to eq '010212'
      end
    end

  end

  describe '.view_request_space' do

    it 'able to return all requested spaces' do
      Request.request_space(user_id: '5', space_id:'18', date:'010212')
      request = Request.view_request_space

      request.each do |request_object|
        expect(request_object['user_id']).to eq '5'
        expect(request_object['space_id']).to eq '18'
        expect(request_object['date']).to eq '010212'
      end
    end

  end

end
