require './config/environment'

class BucketController < ApplicationController

    get '/buckets' do
        redirect "/" if !logged_in?
        @user = current_user
        @buckets = Bucket.all.find_all { |bucket| bucket.user_id == current_user.id}
        erb :"/buckets/user_home"
    end

    # Create
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
        redirect "/buckets"       
    end

    # Update/Edit routes
    get '/buckets/:id/edit' do
        redirect '/' if !logged_in?
        @bucket = Bucket.find(params[:id])
        redirect '/failure' if @bucket.user_id != current_user.id
        erb :"/buckets/edit_bucket"
    end

    patch '/buckets/:id' do
        redirect '/failure' if !logged_in?
        redirect "/buckets/#{params[:id]}/edit" if params[:bucket][:name].length == 0
        bucket = Bucket.find(params[:id])
        redirect 'failure' if bucket.user_id != current_user.id
        bucket.update(params[:bucket])
        bucket.save
        redirect '/buckets'
    end

    # delete routes
    delete '/buckets/:id/delete' do
        redirect '/failure' if !logged_in?
        bucket = Bucket.find(params[:id])
        redirect 'failure' if bucket.user_id != current_user.id
        bucket.goals.each { |goal| Goal.delete(goal.id)}
        Bucket.delete(params[:id])
        redirect '/buckets'
    end  

end
