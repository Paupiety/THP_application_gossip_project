module SessionsHelper
    def current_user()
        User.find_by(id: session[:user_id])
    end

    def log_in(user)
        session[:user_id] = user.id
    end

    def authenticate_user()
        unless current_user
            flash[:error] = "Connecte-toi pour accéder aux gossips ou en créer un"
            redirect_to new_session_path
        end
    end

end
