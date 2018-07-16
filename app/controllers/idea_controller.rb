require './config/environment'
require 'pry'

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
        # - params => {"category_ids"=>["1", "3"]}
        # - want to find all ideas where idea.categories contains one of the values in
        #   params[:category_ids]
        # - @ideas = Idea.where(category_id: [1,3])   # error no category_id in Idea
        # Hardcoded works ok : 
        category_ideas = CategoryIdea.where(category_id: [1,3]) 
        # Following works ok if only 1 category id: 
        #   category_ideas = CategoryIdea.where("category_id IN ?", params[:category_ids])
        @ideas = category_ideas.map { |ci| Idea.find(ci.idea_id) }
        erb :"/ideas/show"
    end  

    get '/ideas/:id/newgoal' do
        # To Do
        redirect :"/user-home" #temporary
    end

end
