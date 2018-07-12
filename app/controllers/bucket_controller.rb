require './config/environment'
require 'pry'
class BucketController < ApplicationController

    get '/buckets/new' do
        redirect "/login" if !logged_in?
        erb :"/buckets/create_bucket"
    end  
    post '/buckets' do
        redirect "/login" if !logged_in?
        redirect '/buckets/new' if params[:name].length == 0
        user = User.find(session[:user_id])
        bucket = Bucket.create(:name => params[:name], :description => params[:description])
        user.buckets << bucket
        user.save
        redirect "/user_home"       
    end

    get '/buckets/:id' do
        redirect "/login" if !logged_in?
        @bucket = Bucket.find(params[:id])
        redirect "/failure" if current_user.id != @bucket.user_id
        erb :"/buckets/show_bucket"
    end
    
    get '/buckets/:id/edit' do
        redirect '/' if !logged_in?
        @bucket = Bucket.find(params[:id])
        redirect '/fauilure' if @bucket.user_id != session[:user_id]
        erb :"/buckets/edit_bucket"
    end
    patch '/buckets/:id' do
        redirect '/failure' if !logged_in?
        redirect "/buckets/#{params[:id]}/edit" if params[:bucket][:name].length == 0
        bucket = Bucket.find(params[:id])
        redirect 'failure' if bucket.user_id != current_user.id
        bucket.update(params[:bucket])
        bucket.save
        redirect '/user_home'
    end

    get '/buckets/:id/goals/new' do
        redirect '/failure' if !logged_in?
        @bucket = Bucket.find(params[:id])
        redirect "/user_home" if @bucket.user_id != current_user.id
        erb :"/buckets/create_goal"
    end
    post '/buckets/:id/goal' do
        redirect '/failure' if !logged_in?
        bucket = Bucket.find(params[:id])
        redirect "/user_home" if bucket.user_id != current_user.id
        goal = Goal.new(:title=>params[:title], :description=>params[:description])
        bucket.goals << goal
        redirect "/failure" if !bucket.save
        redirect "user_home"
    end

end
