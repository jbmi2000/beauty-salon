class CustomersController < ApplicationController

    get '/customers' do
         # binding.pry
        @user = Helpers.current_user(session)
        # binding.pry
        @customers=@user.customers  # for displaying only the current user's customers
                
        erb :'/customers/index'
    end
    
    get '/customers/new' do
        @user = Helpers.current_user(session)
        erb :'/customers/new'
    end

    post '/customers' do
        # binding.pry
        #  if Helpers.is_logged_in?(session)
        @user = Helpers.current_user(session) 
        # binding.pry  
        @customer=Customer.create(user_id: @user.id, name: params[:name], phone: params[:phone], notes: params[:notes]) 
        #  end
        # if customer.valid?
         redirect '/customers'
        # erb :'/customers'
    end 

    get '/customers/index' do
        @user=Helpers.current_user(session)
         # binding.pry
        #@customers = Customer.user_id
        @customers = @user.customers
        # @customers = Customer.find_by(@user.id)
        erb :'/customers/index'
    end 

    get '/customers/:id/show' do
        @user=Helpers.current_user(session)
        
        @c=Customer.find(params[:id])
        
        erb :'/customers/show'
        
      end

    #   get '/customers/:id/show' do
    #     @user=Helpers.current_user(session)
    #      # binding.pry
    #     @c=Customer.find(params[:id])
        
    #     erb :'/customers/show'
        
    #   end

    get '/customers/:id/edit' do
        @c=Customer.find(params[:id])
        erb :'/customers/edit'

    end

    post '/customers/show' do


    end

    patch '/customers/:id' do
        @c=Customer.find(params[:id])
        @c.update(name: params[:name], phone: params[:phone], notes: params[:notes])
        
        # binding.pry
        redirect "/customers/#{@c.id}/show"
      end

    
    delete '/customers/:id' do
        c = Customer.find(params[:id])
        c.destroy
        redirect '/customers'
    end
       
 

end
