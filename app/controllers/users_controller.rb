class UsersController < ApplicationController

    def new()
        @cities = City.all
    end

    def create()
        @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], age: params[:age], description: params[:description], city_id: params[:city_id], password_digest: BCrypt::Password.create(params[:password_digest]), password_confirmation: params[:password_digest])
        if @user.save
            redirect_to "/sessions/new"
            flash[:success] = "Votre compte a bien été créé"
        else
            redirect_to "/users/new"
            flash[:error] = "Nous n'avons pas réussi à créer votre compte pour la (ou les) raison(s) suivante(s) : #{@gossip.errors.full_messages.join(",")}"
        end
    end

    def show()
        id = params[:id]
        @user = User.find(id)
    end

end