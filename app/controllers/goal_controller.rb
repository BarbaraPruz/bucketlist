require './config/environment'
require 'pry'

class GoalController < ApplicationController
  
    get '/buckets/:id/goals/new' do
        redirect '/failure' if !logged_in?
        @bucket = Bucket.find(params[:id])
        redirect "/user_home" if @bucket.user_id != current_user.id
        erb :"/goals/create_goal"
    end
    post '/buckets/:id/goals' do
        redirect '/failure' if !logged_in?
        bucket = Bucket.find(params[:id])
        redirect "/user_home" if bucket.user_id != current_user.id
        goal = Goal.new(:title=>params[:title], :description=>params[:description])
        bucket.goals << goal
        redirect "/failure" if !bucket.save
        redirect "user_home"
    end
    get '/buckets/:id/:goal_id/edit' do
        redirect '/' if !logged_in?
        @bucket = Bucket.find(params[:id])
        @goal = Goal.find(params[:goal_id])
        redirect '/failure' if @bucket.user_id !=current_user.id
        redirect '/failure' if @goal.bucket_id != @bucket.id
        erb :"/goals/edit_goal"
    end
    patch '/buckets/:id/:goal_id' do
        redirect '/failure' if !logged_in?
        redirect "/buckets/#{params[:id]}/#{params[:goal_id]}/edit" if params[:goal][:title].length == 0
        bucket = Bucket.find(params[:id])
        goal = Goal.find(params[:goal_id])
        redirect 'failure' if bucket.user_id != current_user.id
        redirect 'failure' if goal.bucket_id != bucket.id
        goal.update(params[:goal])
        goal.save
        redirect '/user_home'
    end

    delete '/buckets/:id/:goal_id/delete' do
        redirect '/failure' if !logged_in?
        bucket = Bucket.find(params[:id])
        goal = Goal.find(params[:goal_id])
        redirect 'failure' if bucket.user_id != current_user.id
        redirect 'failure' if goal.bucket_id != bucket.id
        Goal.delete(params[:goal_id])
        redirect '/user_home'
    end   

end
