require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "fbucket"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/user_home"
    else
      redirect "/failure"
    end
  end

  get '/user_home' do
    redirect "/login" if !logged_in?
    @user = current_user
    @buckets = Bucket.all.find_all { |bucket| bucket.user_id == current_user.id}
    erb :"/user_home"
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
