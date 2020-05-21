require 'request'
require 'reserve_space'

describe Request do
  
  describe '.see_requests' do
    it 'returns a list of requests' do
      Space.add_space(user_id: 1, space_name: 'Room', description: 'Room Description', price: '50', dates_available: '1 January 2020, 3 January 2020')
      ReserveSpace.reserve_space(user_id: 1, space_id: 1, date: '1 January 2020')
      reserve_space = ReserveSpace.view_reserve_space
      
      reserve_space.each do |reserve|
        expect(reserve['user_id']).to eq '1'
      end
     end
   end

   describe 'Able to see requests as pending' do
    it 'able to approve requests made' do
      Space.add_space(user_id: 1, space_name: 'Room', description: 'Room Description', price: '50', dates_available: '1 January 2020, 3 January 2020')
      ReserveSpace.reserve_space(user_id: 1, space_id: 1, date: '1 January 2020')

      approve_space = ReserveSpace.view_reserve_space
      
      approve_space.each do |approve|
        expect(approve['requests']).to eq 'Pending'
      end
     end
    end
  
   describe '.approve_requests' do
    it 'able to approve requests made' do
      Space.add_space(user_id: 1, space_name: 'Room', description: 'Room Description', price: '50', dates_available: '1 January 2020, 3 January 2020')
      ReserveSpace.reserve_space(user_id: 1, space_id: 1, date: '1 January 2020')
      Request.approve_space(id: 1)

      approve_space = ReserveSpace.view_reserve_space
      
      approve_space.each do |approve|
        expect(approve['requests']).to eq 'Booking Confirmed'
      end
     end
    end

end
