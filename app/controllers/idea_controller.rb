require './config/environment'
require 'pry'

class IdeaController < ApplicationController

    get '/ideas' do
        redirect "/login" if !logged_in?
        @ideas = Idea.all
        erb :"/ideas/show"
    end  

end
