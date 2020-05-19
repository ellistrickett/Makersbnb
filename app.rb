require 'sinatra/base'

class MakersBnB < Sinatra::Base

enable :sessions

  get '/' do
    'Hello World'
  end

  get '/users/new' do 
    erb :"signup"
  end

  post '/sign-up-user' do
    User.create(real_name: params['name'], email: params['email'], password: params['password'])
    redirect '/login'
  end

  get '/login' do
    
    erb :"login"
  end

  post '/log-in-details' do 
    user = User.login(email: params['email'], password: params['password'])
    session[:user] = user
    redirect '/welcome'
  end

  get '/welcome' do 
    @user = session[:user]
    erb :"welcome"
  end

  run! if app_file == $0
end
