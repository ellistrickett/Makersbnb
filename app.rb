require 'sinatra/base'
require './lib/space'

class MakersBnB < Sinatra::Base
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
  get '/makersbnb' do
    @space = Space.view_spaces
    erb :'makersbnb/space'
  end

  get '/makersbnb/add-space' do
    erb :'makersbnb/add_space'
  end

  post '/makersbnb' do
    Space.add_space(space_name: params[:name], description: params[:description], price: params[:price], dates_available: params[:dates_available])
    redirect '/makersbnb'
  end

  run! if app_file == $0
end
