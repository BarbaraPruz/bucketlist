require './config/environment'

class BucketController < ApplicationController
    get '/buckets/:id' do
        redirect "/login" if !logged_in?
        @bucket = Bucket.find(params[:id])
        redirect "/failure" if current_user.id != @bucket.user_id
        erb :"/buckets/show_bucket"
    end

end
