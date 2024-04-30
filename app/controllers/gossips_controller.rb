class GossipsController < ApplicationController

    def show()
        id = params[:id]
        @gossip = Gossip.find(id)
    end

    def new()
        @gossip = Gossip.new
    end

    def create()
        @gossip = Gossip.new(title: params[:title], description: params[:description])
        if @gossip.save
            redirect_to "/accueil"
            flash[:success] = "Votre gossip a bien été créé"
        else
            redirect_to "/gossips/new"
            flash[:error] = "Nous n'avons pas réussi à créer le potin pour la (ou les) raison(s) suivante(s) : #{@gossip.errors.full_messages.join(",")}"
        end
    end

end
