require 'space'

describe Space do

  describe '.add_space' do
    it 'should be able to add space to DB' do
      Space.add_space(user_id: 1, space_name: 'Room', description: 'Room Description', price: '50', dates_available: '1 January 2020, 3 January 2020')
      connect_to_database = PG.connect dbname: 'makersbnb_test'
      space = connect_to_database.exec("SELECT * FROM space")

      space.each do |space_object|
        # p space_object
        expect(space_object['space_name']).to eq 'Room'
      end
    end

    describe '.view_spaces' do
      it 'should be able to view spaces' do
        Space.add_space(user_id: 1, space_name: 'Room 2', description: 'Room Description 2', price: '80', dates_available: '1 January 2020, 3 January 2020')
        space = Space.view_spaces

        space.each do |space_object|
          # p space_object
          expect(space_object['description']).to eq 'Room Description 2'
        end
      end
    end

    describe '.delete_space' do
      it 'should be able to delete space from DB' do
        Space.add_space(user_id: 1, space_name: 'Room 2', description: 'Room Description 2', price: '80', dates_available: '1 January 2020, 3 January 2020')
        Space.delete_space(id: 1)
        space = Space.view_spaces
        
        space.each do |delete_space| 
          # p delete_space
          expect(delete_space['1']).to eq nil
        end
  
      end
    end

  end

end
