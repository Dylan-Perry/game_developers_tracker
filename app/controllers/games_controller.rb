class GamesController < ApplicationController
    def index
        @games = Game.order(created_at: :DESC)
    end

    def new

    end

    def create
        game = Game.new({
            name: params[:name],
            players: params[:players],
            online: params[:online]
        })

        game.save

        redirect_to "/games"
    end

    def show
        @game = Game.find(params[:id])
    end

    def edit
        @game = Game.find(params[:id])
    end

    def update
        game = Game.find(params[:id])
        game.update(game_params)

        redirect_to "/games/#{game.id}"
    end

    def game_params
        params.permit(:name, :players, :online)
    end
end