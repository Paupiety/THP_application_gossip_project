class StaticPagesController < ApplicationController
    require "bundler"
    Bundler.require

    def accueil()
        @firstname = params['first_name']
        @gossips = Gossip.all
    end

    def who_are_you()
        User.create(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], age: params['age'], description: params['description'])
    end
end

