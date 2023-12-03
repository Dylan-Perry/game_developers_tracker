class DevsController < ApplicationController
    def index
        @devs = Dev.all
    end

    def new
        
    end

    def create
        
    end
    
    def show
        @dev = Dev.find(params[:id])
    end

    def index_dev_games
        self.show
    end
end