class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/users' do
       # binding.pry
       user = User.create(params)  #no instance variable needed since redirect triggers a new request meaning no access to the instance variable going forward
       redirect to "/users/#{user.id}"
    end

    get '/users/:id' do  # dynamic route
        # binding.pry
        @user = User.find_by(id: params[:id])

        erb :'users/show'
    
    end  


end