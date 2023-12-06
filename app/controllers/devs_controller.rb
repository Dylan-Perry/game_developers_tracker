class DevsController < ApplicationController
    def index
        if params[:sort] # Useful later for sorting, US-16; check custom sort method below
            @devs = Dev.sort(params[:sort])
        else
            @devs = Dev.order(created_at: :DESC)
        end
    end

    def new
        
    end

    def create
        dev = Dev.create(dev_params)

        redirect_to "/devs/#{dev.id}"
    end
    
    def show
        @dev = Dev.find(params[:id])
    end

    def edit
        @dev = Dev.find(params[:id])
    end

    def update
        dev = Dev.find(params[:id])
        dev.update(dev_params)

        redirect_to "/devs/#{dev.id}"
    end

    def destroy
        dev = Dev.find(params[:id])
        dev.destroy

        redirect_to "/devs"
    end

    def self.sort(type) # see notes above on sorting
        if type == "alpha"
            Dev.order(created_at: :DESC)
        end
    end

    def dev_params
        params.permit(:name, :employees, :operational)
    end
end