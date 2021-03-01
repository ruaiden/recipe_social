class Recipe < ActiveRecord::Base
    has_many :recipes_users
    has_many :users, through: :recipes_users
end 