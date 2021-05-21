class UsersController < ApplicationController

    get "/users" do
        @users = User.all
        erb :"users/index"
    end

    get "/profile" do
        redirect "/users/#{current_user.id}"
    end

    get "/users/new" do
        erb :"users/new"
    end

    get "/users/:id" do
        @user = User.find(params[:id])
        erb :"users/show"
      end


    post "/users" do
       user = User.create(params) 
       if user.valid?
         session[:user_id] = user.id
         redirect "/" #this will not be final this is just initial set-up
       else 
        flash[:errors] = user.errors.full_messages
        redirect "/users/new"
      end
    end


end