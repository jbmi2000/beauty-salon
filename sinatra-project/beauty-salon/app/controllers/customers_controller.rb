class CustomersController < ApplicationController

    get '/customers/new' do
        erb :'/customers/new'
    end
    
    post '/customers' do
       Customer.create(name: params[:name], phone: params[:phone], notes: params[:notes]) 
       
    
    end

end
