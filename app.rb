require 'sinatra/base'
require './lib/space'
require './lib/booking'
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
    @space = Space.view_spaces
    erb :'makersbnb/space'
  end

  get '/makersbnb/add-space' do
    @user = session[:user]
    erb :'makersbnb/add_space'
  end

  get '/makersbnb/book-space' do
    erb :'makersbnb/book_space'
  end

  post '/makersbnb-book' do
    Booking.book_space(user_id: '1', space_id:'12', date: params[:date])  #space_id and user_id will be passed as session variables
    redirect '/makersbnb'
  end

  post '/makersbnb' do
    Space.add_space(user_id: 1, space_name: params[:name], description: params[:description], price: params[:price], dates_available: params[:dates_available])
    redirect '/makersbnb'
  end

  run! if app_file == $0
end
