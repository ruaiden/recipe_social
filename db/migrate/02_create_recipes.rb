class CreateRecipes < ActiveRecord::Migration[4.2]
  def change
      create_table :recipes do |r|
        r.string :title
        r.string :ingredients
        r.integer :time
        r.string :step_1
        r.string :step_2
        r.string :step_3
        r.integer :user_id
        r.text :url
      end 
  end
end
