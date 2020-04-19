class UsersController < ApplicationController

    get '/users' do
        @users = User.all
        erb :'users/index'
    end
    
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
            redirect to :"/users/#{user.id}"
        end
        erb :'users/login'
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id  # keeping track of user for session
            redirect to "users/#{user.id}"
        else
            redirect to '/signup'

        end

    end

    post '/signup' do
       user = User.create(params)  #no instance variable needed since redirect triggers a new request meaning no access to the instance variable going forward
       binding.pry
       if user.valid?
        session[:user_id] = user.id
        redirect to "/users/#{user.id}"
       else
        redirect to '/signup'
       end
    end

    get '/users/:id' do  # dynamic route
        if User.find_by(id: params[:id])
            @user = User.find_by(id: params[:id])
        else
            redirect to '/'
        end
        erb :'users/show'
    
    end
    
    


end