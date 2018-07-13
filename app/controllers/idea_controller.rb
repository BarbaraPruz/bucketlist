require './config/environment'
require 'pry'

class IdeaController < ApplicationController

    get '/ideas' do
        redirect "/login" if !logged_in?
        @ideas = Idea.all.sort { |a,b| a.name <=> b.name }
        erb :"/ideas/show"
    end  

    get '/ideas/search' do
        redirect "/login" if !logged_in?
        @categories = Category.all
        erb :"/ideas/search"
    end  
    post '/ideas/search' do
        redirect "/login" if !logged_in?
# params => {"category_ids"=>["1", "3"]}
        redirect :"/ideas"  # temporary
    end  
end
