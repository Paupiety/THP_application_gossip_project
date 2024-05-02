class AccueilController < ApplicationController
before_action :authenticate_user, only: [:index
]
    def index()
        @firstname = params['first_name']
        @gossips = Gossip.all
    end

    private

    def authenticate_user()
        unless current_user
            flash[:error] = "Connecte-toi pour accéder aux gossips"
            redirect_to new_session_path
        end
    end
end
