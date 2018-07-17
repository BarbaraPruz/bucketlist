require './config/environment'
require 'pry'

class GoalController < ApplicationController
  
    get '/buckets/:bucket_id/goals/new' do
        redirect '/failure' if !logged_in?
        @bucket = Bucket.find(params[:bucket_id])
        redirect "/user-home" if @bucket.user_id != current_user.id
        erb :"/goals/create_goal"
    end
    post '/goals' do
        redirect '/failure' if !logged_in?
        bucket = Bucket.find(params[:bucket_id])
        redirect "/user-home" if bucket.user_id != current_user.id
        goal = Goal.new(params[:goal])
        bucket.goals << goal
        redirect "/failure" if !bucket.save
        redirect "user-home"
    end
    
    get '/goals/:goal_id/edit' do
        redirect '/' if !logged_in?
        @goal = Goal.find(params[:goal_id])        
        @bucket = Bucket.find(@goal.bucket_id)
        redirect '/failure' if @bucket.user_id !=current_user.id
        erb :"/goals/edit_goal"
    end
    patch '/goals/:goal_id' do
        redirect '/failure' if !logged_in?
        redirect "/goals/#{params[:goal_id]}/edit" if params[:goal][:title].length == 0
        goal = Goal.find(params[:goal_id])
        bucket = Bucket.find(goal.bucket_id)
        redirect 'failure' if bucket.user_id != current_user.id
        goal.update(params[:goal])
        if !params[:goal].has_key?(:completed) 
            goal.update(:completed => false)
        end
        goal.save
        redirect '/user-home'
    end

    delete '/goals/:goal_id/delete' do
        redirect '/failure' if !logged_in?
        goal = Goal.find(params[:goal_id])        
        bucket = Bucket.find(goal.bucket_id)
        redirect 'failure' if bucket.user_id != current_user.id
        Goal.delete(params[:goal_id])
        redirect '/user-home'
    end   

end
