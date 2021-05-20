class CardsController < ApplicationController

    get "/cards" do
        @cards = Card.all
        erb :"cards/index"
    end

    get "/cards/:id" do
        @card = Card.find(params[:id])
        erb :"cards/show"
      end

end