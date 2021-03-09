class User < ActiveRecord::Base
    has_many :recipes, through: :recipes_users
    has_many :recipes_users
    
    has_secure_password
    validates :email, presence: true
    validates :email, uniqueness: true

end 