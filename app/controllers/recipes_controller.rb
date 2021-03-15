class RecipesController < ApplicationController
    
    get '/recipes' do 
        @recipe = Recipe.all 
        @recipe_user = Recipe.find_by(user_id: session[:user_id])
        @current_user = session[:user_id] == @recipe_user.user_id
   
        erb :"recipes/recipe"
    end 

    get '/recipes/new' do
        
        @recipe = Recipe.new
        erb :'recipes/new'
    end

    get '/recipes/:id' do 
        @recipe = Recipe.find_by(id: params[:id])
        @current_user = session[:user_id] == @recipe.user_id
            
        erb :"recipes/show"
    end 

    get '/recipes/edit/:id' do 
      
       current_user
            recipe = Recipe.find_by(id: params[:id])
            erb :'recipes/edit'
        
        
    end 

    patch '/recipes/:id' do 
        current_user
        @recipe = Recipe.find(params[:id])
        @recipe.update(params[:recipe])
        redirect to "/recipes/#{@recipe.id}"
        
    end 

    
    post '/recipes/new' do 
    
        @recipe = Recipe.create(params)
        @recipe.user_id = session[:user_id]
        @recipe.save
        flash[:message] = "Successfully created recipe."
        erb :'recipes/show'
  
    end

    delete '/recipes/:id' do 
        current_user
        @recipe = Recipe.find_by_id(params[:id])
            @recipe.delete
            redirect to "/recipes"
    end 

    helpers do 

        def current_user
            @recipe = Recipe.find_by(id: params[:id])
                unless @current_user = session[:user_id] == @recipe.user_id
                    redirect to '/login'
                end   
        end 
    end 

end 



 