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
