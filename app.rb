require 'sinatra/base'
require './lib/space'
require './lib/request'
require './lib/user'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :"signup", :layout => :pre_auth
  end

  post '/sign-up-user' do
    User.create(real_name: params['name'], email: params['email'], password: params['password'])
    redirect '/login'
  end

  get '/login' do
    @user = session[:user]
    erb :"login" , :layout => :pre_auth
  end

  post '/log-in-details' do
    user = User.login(email: params['email'], password: params['password'])
    session[:user] = user
    redirect '/login' if user == "Failure!"
    redirect '/makersbnb'
  end

  get '/makersbnb' do
    @user = session[:user]
    # @request = Request.view_request_space
    @space = Space.view_spaces
    erb :'makersbnb/space'
  end

  get '/requests-customer' do
    @user = session[:user]
    @requests = Request.view_request_space
    @space = Space.view_spaces
    erb :'requests_customer'
  end

  get '/requests-landlord' do
    @user = session[:user]
    @requests = Request.view_request_space
    @space = Space.view_spaces
    erb :'requests_landlord'
  end

  get '/makersbnb/add-space' do
    @user = session[:user]
    erb :'makersbnb/add_space'
  end

  get '/makersbnb/request-space/:id' do
    session[:space_id] = params[:id]
    @reserve_id = params[:id]
    @reserve = Space.view_spaces
    @user = session[:user]
    erb :'makersbnb/request_space'
  end

  post '/makersbnb/delete-space/:id' do
    Space.delete_space(id: params[:id])
    redirect '/makersbnb'
  end

  post '/makersbnb-request' do
    @user = session[:user]
    Request.request_space(user_id: @user.user_id, space_id: session[:space_id], date: params[:request_date])
    redirect '/makersbnb'
  end

  post '/makersbnb-request-landlord' do
    user = session[:user]
    # params[:approve_or_deny] == "Approve Request" ? Request.approve_space(user_id:, space_id:) : Request.decline_space(user_id:, space_id:)
    redirect '/requests-landlord'
  end

  post '/makersbnb-add' do
    user = session[:user]
    space_name = params[:name]
    Space.add_space(user_id: user.user_id, space_name: params[:name], description: params[:description], price: params[:price], dates_available: "#{params[:start_day]} #{params[:start_month]} 2020, #{params[:end_day]} #{params[:end_month]} 2020")
    redirect '/makersbnb'
  end

  get '/template' do
    erb :'template'
  end

  get '/goodbye' do
    @user = session[:user]
    session.clear
    erb :'goodbye', :layout => :pre_auth
  end



  run! if app_file == $0
end
