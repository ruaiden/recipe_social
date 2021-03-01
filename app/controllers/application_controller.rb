require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :session_secret, "secret"
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get "/" do
    erb :index
  end

  get "/new" do 
    @user = User.new
    erb :new
  end 

  get "/login" do 
    erb :login
  end 

  post "/new" do 
    @user = User.create(params)
    
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

  get "/logout" do 
    session.clear

    redirect '/login'
  end 

  helpers do 

  def logged_in?
    !!@current_user
  end 

  def current_user
     User.find_by(id: session[:user_id])
  end 

  def require_login
    unles logged_in?
      redirect '/login'
  end 
end 
end
