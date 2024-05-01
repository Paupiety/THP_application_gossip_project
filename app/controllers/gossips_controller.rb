
class GossipsController < ApplicationController

    def show()
        id = params[:id]
        @gossip = Gossip.find(id)
    end

    def new()
        @tags = Tag.all
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
        GossipTag.create(gossip_id: @gossip.id, tag_id: params[:tag_id])
    end


    def update()
        id = params[:id]
        @gossip = Gossip.find(id)
        @gossip.update(title: params[:title], description: params[:description])
        if @gossip.save
            redirect_to "/gossips/#{@gossip.id}"
            flash[:success] = "Votre gossip a bien été modifié"
        else
            redirect_to "/gossips/edit"
            flash[:error] = "Nous n'avons pas réussi à modifier le potin pour la (ou les) raison(s) suivante(s) : #{@gossip.errors.full_messages.join(",")}"
        end
    end

    def edit()
        id = params[:id]
        @gossip = Gossip.find(id)
    end

    def destroy()
        id = params[:id]
        @gossip = Gossip.find(id)
        @gossip.destroy
        redirect_to "/accueil"
        flash[:success] = "Votre gossip a bien été supprimé"
    end

end


