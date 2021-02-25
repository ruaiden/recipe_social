class CreateRecipes < ActiveRecord::Migration[4.2]
  def change
      create_table :recipes do |r|
        r.string :name
        r.string :ingredients
      end 
  end
end
