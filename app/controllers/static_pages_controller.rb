class StaticPagesController < ApplicationController
    require "bundler"
    Bundler.require


    def index()
        User.create(first_name: params['first_name'], last_name: params['last_name'], email: params['email'], age: params['age'], description: params['description'])
    end
end

