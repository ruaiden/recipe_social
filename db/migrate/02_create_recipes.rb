class CreateRecipes < ActiveRecord::Migration[4.2]
  def change
      create_table :recipes do |r|
        r.string :title
        r.string :ingredients
        r.integer :time
        r.string :instruction
        r.integer :user_id
      end 
  end
end
