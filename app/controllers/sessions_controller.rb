class SessionsController < ApplicationController

    def create()
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password_digest])
            puts "ca fonctionne"
            log_in(@user)
            redirect_to "/accueil"

        else
            redirect_to "/sessions/new"
            flash[:error] = "L'un des deux est incorrect"
        end
    end
    
    def destroy()
        puts "voici la session #{session[:user_id]}"
        session.delete(:user_id)
        redirect_to "/accueil"
        flash[:success] = "Vous êtes deconnecté"
        puts "voici la session #{session[:user_id]}"
    end

end
