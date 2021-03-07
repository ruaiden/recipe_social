class RecipesController < ApplicationController

    get '/recipes/new' do
        
        @recipe = Recipe.new
        erb :'recipes/new'
    end

     get '/recipes' do 
        @recipe = Recipe.all 
        erb :"recipes/recipe"
    end 


    get '/recipes/:id' do
     
            @recipe = Recipe.find_by_id(params[:id])
            @current_user = session[:user_id] == @recipe.user_id
            
            erb :"recipes/show"
    
        
    end 

    get '/recipes/edit/:id' do 
       
        @recipe = Recipe.find_by_id(params[:id])   
            erb :'recipes/edit'
        
    end 

    post '/recipes/new' do 
    
        @recipe = Recipe.create(params)
        erb :'recipes/show'
  
    end 

    patch '/recipes/edit/:id' do 
        @recipe = Recipe.find(params[:id])
        @recipe.update(params[:recipe])

        redirect to "/recipes/#{@recipe.id}"
        
    end 

    
    delete '/recipes/:id' do 
        binding.pry
        @recipe = Recipe.find_by_id(params[:id])
            @recipe.delete
            redirect to "/recipes"
    end 
end 

 