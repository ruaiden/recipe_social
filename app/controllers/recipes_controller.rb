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
            binding.pry
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

    # patch '/recipes/edit/:id' do 
    #     @recipe = Recipe.find(id: params[:id])
    #     # binding.pry
    #     # if @recipe.update(params[:recipe])@recipe.update(params[:recipe]) && @recipe.user_id == current_user
    #     #     redirect to "/recipes/#{@recipe.id}"
    #     # else
    #     #     puts "Sorry"
    #     # end 
    # end 

    

    # delete '/recipes/:id' do 
    #     @recipe = Recipe.find_by_id(params[:id])
    #     if @recipe.user_id == current_user
    #         @recipe.delete
    #         redirect to "/recipes"
    #     else 
    #         erb :login
    #     end
    # end 
end 

 