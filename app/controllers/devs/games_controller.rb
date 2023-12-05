class Devs::GamesController < ApplicationController
    def index
        @dev = Dev.find(params[:id])    
    end
end