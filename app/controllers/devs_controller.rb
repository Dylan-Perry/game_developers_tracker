class DevsController < ApplicationController
    def index
        @devs = Dev.order(created_at: :DESC)
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