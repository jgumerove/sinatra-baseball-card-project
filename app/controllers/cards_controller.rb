class CardsController < ApplicationController

    #new
    get "/cards/new" do
        redirect_if_not_logged_in
        @card = Card.new
        erb :"cards/new"
    end

    #create
    post "/cards" do
        card = current_user.cards.create(params[:card])
          if card.valid?
            flash[:message] = "card sucessfully added!"
            redirect "/cards/#{card.id}"
          else
           flash[:errors] = card.errors.full_messages
           redirect "/cards/new"
          end
    end

    #index
    get "/cards" do
        redirect_if_not_logged_in
        @cards = Card.all
        erb :"cards/index"
    end

    #show
    get "/cards/:id" do
        redirect_if_not_logged_in
        @card = Card.find(params[:id])
        erb :"cards/show"
    end

   #edit
    get "/cards/:id/edit" do
        redirect_if_not_logged_in
        @card = Card.find(params[:id])
          if @card.user == current_user
            erb :"cards/edit"
          else 
            redirect "/users/#{current_user.id}"
       end
    end


    patch "/cards/:id" do
        card = Card.find(params[:id])
        if card.update(params[:card])
          flash[:message] = "card successfully updated!"
          redirect "/cards/#{card.id}"
        else
          flash[:errors] = card.errors.full_messages
          redirect "/cards/#{card.id}/edit"
        end
    end

    delete "/cards/:id" do
        card = Card.find(params[:id])
        card.destroy
        flash[:message] = "card deleted from collection!"
        redirect "/users/#{current_user.id}"
    end


end