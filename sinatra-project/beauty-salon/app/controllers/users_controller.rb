class UsersController < ApplicationController

     get '/dashboard/:id' do
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
     
            erb :'users/show'
        else
            redirect '/login'
        end
        
     end
        
    get '/users' do
        if Helpers.is_logged_in?(session)
            @users = User.all
        else
            redirect to '/'
        end
        erb :'users/index'
    end
    
   

    
    


end