module LikesHelper

    def any_like?()
       Like.find_by(user_id: current_user.id , gossip_id: params[:gossip_id])
    end

end
