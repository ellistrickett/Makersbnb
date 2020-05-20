require_relative '../web_helper'

feature 'request space' do

  scenario 'user can request a space' do
    sign_up
    log_in
    add_request
    click_button 'Request to Book Space'
    fill_in 'request_date', with: '010212'
    click_button 'Request Space'
  end

  scenario 'user can access request page' do
    sign_up
    log_in
    add_request
    click_button 'Request to Book Space'
    expect(page).to have_content 'Request to book a space:'
  end

  # scenario 'user can see their requests' do
  #   sign_up
  #   log_in
  #   # add_request needs to be add_space
  #   add_request
  #
  #   # log_out?
  #
  #   sign_up_customer
  #   log_in_customer
  #   # request to book a space - needs to change
  #   click_button 'Request to Book Space'
  #
  #   fill_in('request_date', with: "01.01")
  #   click_button 'Request Space'
  #
  #   # log_out?
  #   log_in
  #   click_link('View Requests')
  #
  #   expect(page).to have_content '01.01'
  # end

end




# FOR VIEW!
# <% @request.each do |get_request| %>
#   <ul>
#     <li>
#       User ID: <%= get_request['user_id'] %>
#       Space ID: <%= get_request['space_id'] %>
#       Date: <%= get_request['date'] %>
#     </li>
#   </ul>
# <% end %>
