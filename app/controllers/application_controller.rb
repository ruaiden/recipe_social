require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  

  configure do
    set :public_folder, 'public'
    enable :sessions
    set :views, 'app/views'
    set :session_secret, "secret"  
    set :method_override, true
    use Rack::Flash
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

  get "/logout" do 
    session.clear
    flash[:message] = "Come Again!"
    redirect '/login'
  end 


  post "/new" do
    binding.pry
  
    @user = User.new(params)
    @user.valid?
    @user.save
    
    session[:user_id]=@user.id
    
    
    erb :"login"
  end 


  post "/login" do
    
    @user = User.find_by(:email => params[:email])

    if @user 
      @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:message] = "You've been successfully logged in"
      binding.pry
      erb :account
    else
      flash[:message] = "Login failed. Try again."
      redirect to '/login'
    end
      
   
    end 

  delete '/delete' do 
    binding.pry
    @user = User.find_by(params[:id])
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
