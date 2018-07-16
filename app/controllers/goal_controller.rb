require './config/environment'
require 'pry'

class GoalController < ApplicationController
  
    get '/goals/new/:bucket_id' do
        redirect '/failure' if !logged_in?
        @bucket = Bucket.find(params[:bucket_id])
        redirect "/user-home" if @bucket.user_id != current_user.id
        erb :"/goals/create_goal"
    end
    # QUESTION: note that the post route doesn't line up with the get route for the form!
    post '/goals' do
        redirect '/failure' if !logged_in?
        bucket = Bucket.find(params[:bucket_id])
        redirect "/user-home" if bucket.user_id != current_user.id
        goal = Goal.new(:title=>params[:title], :description=>params[:description])
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
