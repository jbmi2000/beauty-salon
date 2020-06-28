class SessionsController < ApplicationController

    get '/signup' do
        if Helpers.is_logged_in?(session)
            user = Helpers.current_user(session)
            redirect to :"/users/#{user.id}"
        end
        erb :'users/signup'
    end

    get '/login' do
        if Helpers.is_logged_in?(session)
            user = Helpers.current_user(session)
            redirect '/dashboard'
            
        end
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id  # keeping track of user for session
            redirect '/dashboard'
            
        else
            @error = "Invalid Credentials"
            erb :'users/login'  #redirect to '/signup'

        end

    end

    post '/signup' do
       @user = User.create(username: params[:username], email: params[:email], password: params[:password])  # @user to present errors if signup exists or is invalid
       if @user.valid?
        #session[:user_id] = @user.id
        redirect '/users/login'
       else
        erb :'users/signup' #redirect to '/signup'
       end
    end

    get '/users/:id' do  # dynamic route
        if Helpers.is_logged_in?(session) && User.find_by(id: params[:id])
            @user = User.find_by(id: params[:id])
        else
            redirect to '/'
        end
        erb :'users/show'
    
    end

    get '/logout' do 
        session.clear
        redirect to '/'
    end

end