class RecipesController < ApplicationController

    get '/recipes' do 
        @recipe = Recipe.all 
        erb :"recipes/recipe"
    end 

    get '/recipes/new' do 
     
        if @current_user == session[:user_id]
            @recipe = Recipe.new
            erb :'recipes/new'
        else
            erb :index
        end 
    end 

    get '/recipes/:id' do
        @recipe = Recipe.find_by_id(params[:id])
        binding.pry
        if @recipe.user_id == current_user
            erb :"recipes/show"
        else 
            @recipe = Recipe.all
            @error = "Not Authorized"
            erb :account
        end 
    end 

    

    get '/recipes/edit/:id' do 
       
        @recipe = Recipe.find_by_id(params[:id])
        erb :'recipes/edit'
    end 

    post '/recipes/new' do 
        @recipe = Recipe.create(params)

        redirect to "/recipes/#{@recipe.id}"
    end 

    patch '/recipes/edit/:id' do 
        @recipe = Recipe.find(params[:id])
        
        @recipe.update(params[:recipe])
         redirect to "/recipes/#{@recipe.id}"
    end 

    delete '/recipes/:id' do 
        @recipe = Recipe.find_by_id(params[:id])
        @recipe.delete

        redirect to "/recipes"
    end 


end 