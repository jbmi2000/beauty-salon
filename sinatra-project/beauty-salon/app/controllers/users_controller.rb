class UsersController < ApplicationController

    get '/users' do
        if Helpers.is_logged_in?(session)
            @users = User.all
        else
            redirect to '/'
        end
        erb :'users/index'
    end
    
    
    
    


end