class CustomersController < ApplicationController

    get '/customers/new' do
        @user = Helpers.current_user(session)
        erb :'/customers/new'
    end

    post '/customers/new' do
         if Helpers.is_logged_in(session)
            @customer=Customer.create(name: params[:name], phone: params[:phone], notes: params[:notes]) 
         end
        # if customer.valid?
        #     redirect '/customers'
       
        erb :'customers/show'
    end 

              
       
    get '/customers' do
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
           
        end
        erb :'/customers/show'
    end

end
