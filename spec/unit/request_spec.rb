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


end