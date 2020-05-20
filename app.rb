require 'sinatra/base'
require './lib/space'
require './lib/reserve_space'
require './lib/user'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    erb :"signup"
  end

  post '/sign-up-user' do
    User.create(real_name: params['name'], email: params['email'], password: params['password'])
    redirect '/login'
  end

  get '/login' do
    @user = session[:user]
    erb :"login"
  end

  post '/log-in-details' do
    user = User.login(email: params['email'], password: params['password'])
    session[:user] = user
    redirect '/login' if user == "Failure!"
    redirect '/makersbnb'
  end

  get '/makersbnb' do
    @user = session[:user]
    @reserve = ReserveSpace.view_reserve_space
    @space = Space.view_spaces
    erb :'makersbnb/space'
  end

  get '/makersbnb/add-space' do
    erb :'makersbnb/add_space'
  end

  get '/makersbnb/reserve-space/:id' do
    session[:space_id] = params[:id]
    @reserve_id = params[:id]
    @reserve = Space.view_spaces
    erb :'makersbnb/reserve_space'
  end

  post '/makersbnb/delete-space/:id' do
    Space.delete_space(id: params[:id])
    redirect '/makersbnb'
  end

  post '/makersbnb-reserve' do
    user = session[:user]
    ReserveSpace.reserve_space(user_id: user.user_id, space_id: session[:space_id], date: params[:reserve_day])  #space_id and user_id will be passed as session variables
    redirect '/makersbnb'
  end

  post '/makersbnb' do
    user = session[:user]
    Space.add_space(user_id: user.user_id, space_name: params[:name], description: params[:description], price: params[:price], dates_available: "#{params[:start_day]} #{params[:start_month]} 2020, #{params[:end_day]} #{params[:end_month]} 2020")
    redirect '/makersbnb'
  end

  get '/template' do
    erb :'template'
  end

  run! if app_file == $0
end
