class Devs::GamesController < ApplicationController
    def index
        @dev = Dev.find(params[:id])
    end

    def new
        @dev = Dev.find(params[:id])
    end

    def create
        dev = Dev.find(params[:id])
        dev.games.create(game_params)

        redirect_to "/devs/#{dev.id}/games"
    end

    def game_params
        params.permit(:name, :players, :online, :dev_id)
    end
end