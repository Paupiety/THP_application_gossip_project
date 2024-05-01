class Gossip < ApplicationRecord
    validates :title, presence: {message: "Le titre est obligatoire"}, length:{in: 3..30, message: "Le titre doit être compris entre 3 et 30 caractères"}
    validates :description, presence: {message: "La description est obligatoire"}
    belongs_to :user, optional: true
    has_many :gossip_tags
    has_many :tags, through: :gossip_tags
    has_many :comments
end

# def validate_update()
#     if 
# end
