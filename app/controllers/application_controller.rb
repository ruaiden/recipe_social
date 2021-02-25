require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :index
  end

  get "/new" do 
    erb :new
  end 

  get "/login" do 
    erb :login
  end 

  post "/new" do 
   
    @user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
    
    redirect to '/login'
  end


  post "/login" do
    
    @user = User.find_by(:email => params[:email])
    
    if @user.authenticate(params[:password])
      erb :account
    else
      redirect to '/login'
    end
    end 

  
end
