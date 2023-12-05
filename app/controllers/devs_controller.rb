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
        dev = Dev.new({
            name: params[:name],
            employees: params[:employees],
            operational: params[:operational]
        })

        dev.save

        redirect_to "/devs"
    end
    
    def show
        @dev = Dev.find(params[:id])
    end

    def self.sort(type) # see notes above on sorting
        if type == "alpha"
            Dev.order(created_at: :DESC)
        end
    end
end