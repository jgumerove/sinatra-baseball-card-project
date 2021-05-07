class UsersController < ApplicationController

    get "/users/new" do
        erb :"users/new"
    end

    post "/users" do
       user = User.create(params) 
       session[:user_id] = user.id
       redirect "/" #this will not be final this is just initial set-up
    end

end