class CreateRecipesUsers < ActiveRecord::Migration[4.2]

    def change
       create_table :recipes_users do |a|
            a.integer :recipe_id
            a.integer :user_id
       end
    end 
end
 