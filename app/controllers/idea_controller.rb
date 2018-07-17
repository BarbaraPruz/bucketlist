require './config/environment'

class IdeaController < ApplicationController

    get '/ideas' do
        redirect "/" if !logged_in?
        @ideas = Idea.all.sort { |a,b| a.name <=> b.name }
        erb :"/ideas/show"
    end  

    get '/ideas/search' do
        redirect "/" if !logged_in?
        @categories = Category.all
        erb :"/ideas/search"
    end  
    post '/ideas/search' do
        redirect "/login" if !logged_in?
        @ideas = Idea.find_by_categories(params[:category_ids])
        erb :"/ideas/show"
    end  

    get '/ideas/:id/newgoal' do
        redirect "/" if !logged_in?
        @buckets = Bucket.all.find_all { |bucket| bucket.user_id == current_user.id}
        redirect "/failure" if @buckets.empty?
        @idea = Idea.find(params[:id])
        erb :"/ideas/create_goal_from_idea"      
    end

end
