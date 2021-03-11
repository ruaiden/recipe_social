require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :views, 'app/views'
    set :session_secret, "secret"  
    set :method_override, true
    register Sinatra::Flash

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

  get "/account" do 
    @user = @user = User.find_by(params[:id])
    
    if session[:user_id] = @user.id
      erb :account
    else 
      redirect to '/login'
    end 
  end 

  get "/logout" do 
    session.clear
    flash[:info] = "You are logged out"
    redirect '/login'
  end 


  post "/new" do
   
    @user = User.new(params)
    @user.valid?
    @user.save
    
    session[:user_id]=@user.id
    
    
    erb :"login"
  end 


  post "/login" do
    
    @user = User.find_by(:email => params[:email])  
    if @user.authenticate(params[:password]) 
      session[:user_id] = @user.id
      erb :account
    else
      flash[:error] = "Invalid login"   
      redirect to '/login'
    end
      
   
    end 


  delete '/delete' do 
    @user = User.find_by(id: params[:id])
        @user.delete
        
        redirect to '/login'
end 
#   helpers do 

#   def logged_in?
#     !!@current_user
#   end 

#   def current_user
#     @current_user ||= User.find(session[:user_id]) if 
#     session[:user_id].present?
#   end 
# end 
# end
end
