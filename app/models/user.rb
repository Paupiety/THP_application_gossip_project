class User < ApplicationRecord
    has_secure_password
    has_many :gossips
    has_many :tags
    has_many :recipients
    has_many :comments
    has_many :likes
    has_many :messages, through: :recipients
    belongs_to :city, optional: true
    validates :password_digest, presence: {message: "Un mot de passe est obligatoire voyons"}, length:{minimum: 6}

end
