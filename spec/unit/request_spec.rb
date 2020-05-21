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
        expect(request_object['status']).to eq 'Pending'
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
        expect(request_object['status']).to eq 'Pending'
      end
    end

  end

  describe '.approve_request_space' do

    it 'able to approve requested spaces' do
      Request.request_space(user_id: 5, space_id: 18, date:'010212')
      Request.approve_space(user_id: 5, space_id: 18)
      request = Request.view_request_space

      request.each do |approve_object|
        expect(approve_object['user_id']).to eq '5'
        expect(approve_object['space_id']).to eq '18'
        expect(approve_object['date']).to eq '010212'
        expect(approve_object['status']).to eq 'Request Approved'
      end
    end

  end

  describe '.approve_request_space' do

    it 'able to approve requested spaces' do
      Request.request_space(user_id: 5, space_id: 18, date:'010212')
      Request.decline_space(user_id: 5, space_id: 18)
      decline = Request.view_request_space

      decline.each do |decline_object|
        expect(decline_object['user_id']).to eq '5'
        expect(decline_object['space_id']).to eq '18'
        expect(decline_object['date']).to eq '010212'
        expect(decline_object['status']).to eq 'Request Declined'
      end
    end

  end

  describe '.update_dates_available' do

    it 'able to update dates for spaces' do
      Space.add_space(user_id: 1, space_name: 'Room', description: 'Room Description', price: '50', dates_available: '1 January 2020, 3 January 2020')
      Request.update_dates_available(space_id: 1, updated_dates: '1 January 2020')
      connect_to_database = PG.connect dbname: 'makersbnb_test'
      space = connect_to_database.exec("SELECT * FROM space")


      space.each do |space_object|
        expect(space_object['dates_available']).not_to include '1 January 2020'
      end
    end

  end

end
