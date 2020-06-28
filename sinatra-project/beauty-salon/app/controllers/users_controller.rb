class UsersController < ApplicationController

     get '/dashboard' do
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
        #     user = Helpers.current_user(session)
            erb :'users/show'
        end
            
         # @user = current_user

    #     erb :"users/show"
    
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