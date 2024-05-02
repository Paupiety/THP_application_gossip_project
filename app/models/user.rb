class User < ApplicationRecord
    has_secure_password
    has_many :gossips
    has_many :tags
    has_many :recipients
    has_many :comments
    has_many :likes
    has_many :messages, through: :recipients
    belongs_to :city
    validates :password, presence: {message: "Un mot de passe est obligatoire voyons"}, length:{minimum: 6}
    validates :last_name, presence: {message: "Le prénom est obligatoire"}
    validates :first_name, presence: {message: "Le nom est obligatoire"}
    validates :email, presence: {message: "Le nom est obligatoire"}, uniqueness: {message: "L'email a déjà été utilisée'"}

end