class LikesController < ApplicationController
    before_action :authenticate_user

    def create()
        unless any_like?
        @like = Like.create(user_id: current_user.id , gossip_id: params[:gossip_id])
        end
        redirect_to request.referer
    end

    def destroy()
        @like = Like.find_by(id: params[:id])
        @like.destroy
        redirect_to request.referer
    end

end
