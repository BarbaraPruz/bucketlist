require './config/environment'
require 'pry'

class GoalController < ApplicationController
  
    get '/goals/new/:bucket_id' do
        redirect '/failure' if !logged_in?
        @bucket = Bucket.find(params[:bucket_id])
        redirect "/user_home" if @bucket.user_id != current_user.id
        erb :"/goals/create_goal"
    end
    # QUESTION: note that the post route doesn't line up with the get route for the form!
    post '/goals' do
        redirect '/failure' if !logged_in?
        bucket = Bucket.find(params[:bucket_id])
        redirect "/user_home" if bucket.user_id != current_user.id
        goal = Goal.new(:title=>params[:title], :description=>params[:description])
        bucket.goals << goal
        redirect "/failure" if !bucket.save
        redirect "user_home"
    end
    
    get '/goals/:goal_id/:bucket_id/edit' do
        redirect '/' if !logged_in?
        @bucket = Bucket.find(params[:bucket_id])
        @goal = Goal.find(params[:goal_id])
        redirect '/failure' if @bucket.user_id !=current_user.id
        redirect '/failure' if @goal.bucket_id != @bucket.id
        erb :"/goals/edit_goal"
    end
    # QUESTION : similar to above patch route doesn't match the Get route
    patch '/goals/:goal_id' do
        redirect '/failure' if !logged_in?
        redirect "/goals/#{params[:goal_id]}/#{params[:bucket_id]}/edit" if params[:goal][:title].length == 0
        bucket = Bucket.find(params[:bucket_id])
        goal = Goal.find(params[:goal_id])
        redirect 'failure' if bucket.user_id != current_user.id
        redirect 'failure' if goal.bucket_id != bucket.id
        goal.update(params[:goal])
        goal.save
        redirect '/user_home'
    end

    delete '/goals/:goal_id/:bucket_id/delete' do
        redirect '/failure' if !logged_in?
        bucket = Bucket.find(params[:bucket_id])
        goal = Goal.find(params[:goal_id])
        redirect 'failure' if bucket.user_id != current_user.id
        redirect 'failure' if goal.bucket_id != bucket.id
        Goal.delete(params[:goal_id])
        redirect '/user_home'
    end   

end
