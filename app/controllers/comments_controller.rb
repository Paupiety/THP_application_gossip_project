

class CommentsController < ApplicationController
    before_action :authenticate_user
    
    def create()
        @gossip = Gossip.find(params[:gossip_id])
        @comment = Comment.new(description: params[:description], gossip_id: @gossip.id, user_id: session[:user_id])
        if @comment.save
            redirect_to "/gossips/:id"
        else
            redirect_to "/gossips/:id"
            flash[:error] = "Nous n'avons pas réussi à créer le commentaire pour la (ou les) raison(s) suivante(s) : #{@comment.errors.full_messages.join(",")}"
        end
    end

    def update()
        id = params[:id]
        @comment = Comment.find(id)
        puts "Voici mon comment : #{@comment}"
        @comment.update(description: params[:description])
        if @comment.save
            redirect_to "/gossips/#{@comment.gossip_id}"
            flash[:success] = "Votre commentaire a bien été modifié"
        else
            redirect_to "/gossips/edit"
            flash[:error] = "Nous n'avons pas réussi à modifier le commentaire pour la (ou les) raison(s) suivante(s) : #{@comment.errors.full_messages.join(",")}"
        end
    end

    def edit()
        id = params[:id]
        @comment = Comment.find(id)
    end

    def destroy()
        id = params[:id]
        @comment = Comment.find(id)
        @comment.destroy
        redirect_to "/gossips/#{@comment.gossip_id}"
    end
end
