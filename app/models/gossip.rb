class Gossip < ApplicationRecord
    belongs_to :user, optional: true
    has_many :gossip_tags
    has_many :tags, through: :gossip_tags

    def self.find(id)
        gossip_with_id = Gossip.all.find { |gossip| gossip.id.to_i == id.to_i }
        return  gossip_with_id 
    end
end
