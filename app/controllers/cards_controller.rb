class CardsController < ApplicationController

    #new
    get "/cards/new" do
        @card = Card.new
        erb :"cards/new"
    end

    #create
    post "/cards" do
        card = current_user.cards.create(params[:card])
        redirect "/cards/#{card.id}"
    end

    #index
    get "/cards" do
        @cards = Card.all
        erb :"cards/index"
    end

    #show
    get "/cards/:id" do
        @card = Card.find(params[:id])
        erb :"cards/show"
    end

   #edit
    get "/cards/:id/edit" do
        @card = Card.find(params[:id])
        erb :"cards/edit"
    end

    patch "/cards/:id" do
        card = Card.find(params[:id])
        card.update(params[:card])
        redirect "/cards/#{card.id}"
    end

    delete "/cards/:id" do
        card = Card.find(params[:id])
        card.destroy
        redirect "/cards"
    end

    

end