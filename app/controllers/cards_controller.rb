class CardsController < ApplicationController

    get "/cards" do
        @cards = Card.all
        erb :"cards/index"
    end

    get "/cards/new" do
        erb :"cards/new"
    end

    get "/cards/:id" do
        @card = Card.find(params[:id])
        erb :"cards/show"
    end

    post "/cards" do
        card = current_user.cards.create(params[:card])
        redirect "/cards/#{card.id}"
    end

    get "/cards/:id/edit" do
        @card = Card.find(params[:id])
        erb :"cards/edit"
    end

    

end