require 'sinatra/base'

class MakersBnB < Sinatra::Base
  get '/' do
    'Hello World'
  end

  get '/makersbnb' do
    erb :'makersbnb/space'
  end

  run! if app_file == $0
end
