class RecipesController < ApplicationController

    get '/recipe' do 
        @recipe = Recipe.all 
        erb :"recipes/recipe"
    end 

    get '/recipe/:id' do
        @recipe = Recipe.find_by_id(params[:id])
        erb :"recipes/show"
    end 

    get '/recipes/new' do 
        @recipe = Recipe.new(params)
        erb :'recipes/new'

    end 

    get '/recipes/edit/:id' do 
       
        @recipe = Recipe.find_by_id(params[:id])
        erb :'recipes/edit'
    end 

    patch '/recipes/edit/:id' do 
        
    end 

end 