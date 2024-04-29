class DynamicPagesController < ApplicationController
    def gossips()
        id = params[:id]
        @gossips = Gossip.find(id)
    end

    def user()
        id = params[:id]
        @gossips = Gossip.find(id)
    end
end

