require 'sinatra/base'
require './lib/space'
require './lib/booking'

class MakersBnB < Sinatra::Base
  enable :sessions

  get '/' do
    'Hello World'
  end

  get '/users/new' do
    erb :"signup"
  end

  post '/sign-up-user' do
    $name = params[:name]
    redirect '/welcome'
  end

  get '/welcome' do
    @name = $name
    erb :"welcome"
  end

  get '/makersbnb' do
    @space = Space.view_spaces
    erb :'makersbnb/space'
  end

  get '/makersbnb/add-space' do
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
