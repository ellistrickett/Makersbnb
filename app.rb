require 'sinatra/base'

class MakersBnB < Sinatra::Base
  get '/' do
    'Hello World'
  end

  get '/users/new' do
    erb :"signup"
  end

  run! if app_file == $0
end
