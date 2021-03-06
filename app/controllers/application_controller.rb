require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fbucket"
  end

  get '/' do
    redirect '/buckets' if logged_in?
    erb :index
  end

  post '/login' do
    user = User.find_by(:email => params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/buckets"
    else
      redirect "/failure"
    end
  end

  get '/users/new' do
    redirect '/buckets' if logged_in?
    erb :"/signup"
  end

  post '/users' do
    # fields required in erb but additional check for rspec (or if someone bypasses the form)
    if params[:name].length == 0 || params[:email].length == 0 || params[:password].length == 0
      redirect '/signup'
    end
    user = User.new(:name => params[:name], :email => params[:email].downcase, :password => params[:password])
    redirect "/failure" if !user.save
    session[:user_id] = user.id
    redirect '/buckets'    
  end

  get '/logout' do
    session.clear
    redirect "/"
  end

  get '/failure' do
    erb :"/failure"
  end

  helpers do
    
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

end
