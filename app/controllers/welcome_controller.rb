class WelcomeController < ApplicationController

    def index()
        @firstname = params['first_name']
    end

end
