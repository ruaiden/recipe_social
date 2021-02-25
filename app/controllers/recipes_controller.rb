class RecipesController < ApplicationController

    get '/recipe' do 
        @recipe = Recipe.all 
        erb :"recipes/recipe"
    end 

    get '/recipe/:id' do
        @recipe = Recipe.find_by_id(params[:id])
        erb :"recipes/show"
    end 

end 