class AccueilController < ApplicationController

    def index()
        @firstname = params['first_name']
        @gossips = Gossip.all
    end
end
