class Comment < ApplicationRecord
    validates :description, presence: {message: "Ce champ est obligatoire"}
    belongs_to :user, optional: true
    belongs_to :gossip
end
