class CustomersController < ApplicationController

    get '/customers' do
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
           
        end
        erb :'/customers/show'
    end
    
    get '/customers/new' do
        @user = Helpers.current_user(session)
        erb :'/customers/new'
    end

    post '/customers' do
         if Helpers.is_logged_in(session)
            @customer=Customer.create(name: params[:name], phone: params[:phone], notes: params[:notes]) 
         end
        # if customer.valid?
        redirect '/customers'
       
        # erb :'customers'
    end 

    get '/customers/index' do
        @user=Helpers.current_user(session)
        @customers = Customer.all 
        erb :'/customers/index'
    end          
       
 

end
