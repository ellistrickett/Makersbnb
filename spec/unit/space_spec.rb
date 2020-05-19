require 'space'

describe Space do

  describe '.add_space' do
    it 'should be able to add space to DB' do
      Space.add_space(space_name: 'Room', description: 'Room Description', price: '50', dates_available: '{from: 01.01}')
      connect_to_database = PG.connect dbname: 'makersbnb_test' 
      space = connect_to_database.exec("SELECT * FROM space")
     
      space.each do |space_object|
        # p space_object
        expect(space_object['space_name']).to eq 'Room'
      end
    end

    it 'should be able to view spaces' do
      Space.add_space(space_name: 'Room 2', description: 'Room Description 2', price: '80', dates_available: '{from: 01.01}')
      space = Space.view_spaces

      space.each do |space_object|
        # p space_object
        expect(space_object['description']).to eq 'Room Description 2'
      end
    end
  end
  
end