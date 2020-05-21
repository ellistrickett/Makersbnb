# require 'reserve_space'
#
# describe ReserveSpace do
#
#   describe '.reserve_space' do
#
#     it 'should be able to reserve a space' do
#       ReserveSpace.reserve_space(user_id: '1', space_id:'12', date:'010212')
#       connect_to_database = PG.connect dbname: 'makersbnb_test'
#       reserve = connect_to_database.exec("SELECT * FROM booking")
#
#       reserve.each do |reserve_object|
#         expect(reserve_object['user_id']).to eq '1'
#         expect(reserve_object['space_id']).to eq '12'
#         expect(reserve_object['date']).to eq '010212'
#       end
#     end
#
#   end
#
#   describe '.view_reserve_space' do
#
#     it 'able to return all reserve spaces' do
#       ReserveSpace.reserve_space(user_id: '5', space_id:'18', date:'010212')
#       reserve = ReserveSpace.view_reserve_space
#
#       reserve.each do |reserve_object|
#         expect(reserve_object['user_id']).to eq '5'
#         expect(reserve_object['space_id']).to eq '18'
#         expect(reserve_object['date']).to eq '010212'
#       end
#     end
#
#   end
#
# end
