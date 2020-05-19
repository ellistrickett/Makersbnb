require 'booking'

describe Booking do

  describe '.book_space' do

    it 'should be able to book a space' do
      Booking.book_space(user_id: '1', space_id:'12', date:'010212')
      connect_to_database = PG.connect dbname: 'makersbnb_test'
      booking = connect_to_database.exec("SELECT * FROM booking")

      booking.each do |booking_object|
        expect(booking_object['user_id']).to eq '1'
        expect(booking_object['space_id']).to eq '12'
        expect(booking_object['date']).to eq '010212'
      end
    end

  end

  describe '.view_book_space' do

    it 'able to return all booked spaces' do
      Booking.book_space(user_id: '5', space_id:'18', date:'010212')
      booking = Booking.view_book_space

      booking.each do |booking_object|
        expect(booking_object['user_id']).to eq '5'
        expect(booking_object['space_id']).to eq '18'
        expect(booking_object['date']).to eq '010212'
      end
    end

  end

end
