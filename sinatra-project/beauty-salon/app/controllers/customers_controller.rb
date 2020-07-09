class CustomersController < ApplicationController

    get '/customers' do
        @customers=Customer.all
        erb :'/customers/index'
    end
    
    get '/customers/new' do
        @user = Helpers.current_user(session)
        erb :'/customers/new'
    end

    post '/customers' do
        
        #  if Helpers.is_logged_in(session)
             @customer=Customer.create(name: params[:name], phone: params[:phone], notes: params[:notes]) 
             
        #  end
        # if customer.valid?
         redirect '/customers'
        # erb :'/customers'
    end 

    get '/customers/index' do
        @user=Helpers.current_user(session)
        @customers = Customer.all 
        erb :'/customers/index'
    end 

    get '/customers/:id/edit' do
        @c=Customer.find(params[:id])
        erb :'/customers/edit'

    end

    patch '/customers/:id' do
        @c=Customer.find(params[:id])
      end

    
    delete '/customers/:id' do
        c = Customer.find(params[:id])
        c.destroy
        redirect '/customers'
    end
       
 

end
