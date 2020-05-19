require 'space'

describe Space do

  describe '.add_space' do
    it 'should be able to add space to DB' do
      space = Space.add_space(space_name: 'Room', description: 'Room Description', price: '50', dates_available: '{01.01}')

      space.map do |space_object|
        expect(space_object['space_name']).to eq 'Room'
      end
    end
  end
  
end