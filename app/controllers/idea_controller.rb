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
        @ideas = Idea.find_by_categories(params[:category_ids])
        erb :"/ideas/show"
    end  

    get '/ideas/:id/newgoal' do
        # To Do
        redirect :"/user-home" #temporary
    end

end
