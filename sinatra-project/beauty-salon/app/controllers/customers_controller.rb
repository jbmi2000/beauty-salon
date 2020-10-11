class CustomersController < ApplicationController

    get '/customers' do
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
            @customers=@user.customers  # for displaying only the current user's customers
            erb :'/customers/index'
        else
            @error = "You must be logged in to view this page!"
            erb :'/users/login'
            #redirect '/login'
        end
    end
    
    get '/customers/new' do
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session)
            erb :'/customers/new'
        else
            @error = "You must be logged in to view this page!"
            erb :'/users/login'
            #redirect '/login'
           # redirect '/users/login'
        end
    end

    post '/customers' do
        if Helpers.is_logged_in?(session)
            @user = Helpers.current_user(session) 
            @customer=Customer.create(user_id: @user.id, name: params[:name], phone: params[:phone], notes: params[:notes]) 
                if @customer.valid?
                    redirect "/customers/#{@customer.id}/show"
                else
            redirect '/customers/new'
            end
        else
            redirect '/login'
        end
        # erb :'/customers'
    end 

    get '/customers/index' do
        if Helpers.is_logged_in?(session)
            @user=Helpers.current_user(session)
            @customers = @user.customers
            # @customers = Customer.find_by(@user.id)
            erb :'/customers/index'
        else
            @error = "You must be logged in to view this page!"
            erb :'/users/login'
            # redirect '/login'
        end
    end 

    get '/customers/:id/show' do
        if Helpers.is_logged_in?(session)
            @user=Helpers.current_user(session)
            @c=@user.customers
            if !(@c.ids.to_s.include?(params[:id]))
                @error = "This is not your customer."
                redirect '/customers/index'               
            else
                @cus=Customer.find(params[:id])
                erb :'/customers/show'
            end
        else
            @error = "You must be logged in to view this page!"
            erb :'/users/login'
            # redirect '/login'
        end
        
      end

    get '/customers/:id/edit' do
       
        if Helpers.is_logged_in?(session)
            @user=Helpers.current_user(session)
            @c=@user.customers
             # binding.pry
            if @c.ids.to_s.include?(params[:id])
                @cus=Customer.find(params[:id])
                erb :'/customers/edit'       
            else
                @error = "This is not your customer."
                redirect '/customers/index'               
            end
        else
            @error = "You must be logged in to perform this function!"
            erb :'/users/login'
            # redirect '/login'
        end

    end

    patch '/customers/:id' do
        if Helpers.is_logged_in?(session)
            @user=Helpers.current_user(session)
            @c=Customer.find(params[:id])
            # Helpers.user_customer
            if @c.user != @user
                redirect "/customers/#{@c.id}/show"     
            end

            @c.update(name: params[:name], phone: params[:phone], notes: params[:notes])
            redirect "/customers/#{@c.id}/show"
        else
            @error = "You must be logged in to perform this function!"
            erb :'/users/login'
            # redirect '/login'
        end
      end

    
    delete '/customers/:id' do
        if Helpers.is_logged_in?(session)
            @c = Customer.find(params[:id])
            @c.destroy
            redirect '/customers'
        else
            @error = "You must be logged in to perform this function!"
            erb :'/users/login'
            # redirect '/login'
        end
    end
       
 

end
