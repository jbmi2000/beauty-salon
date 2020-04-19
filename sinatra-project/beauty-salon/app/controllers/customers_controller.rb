class CustomersController < ApplicationController

    get '/customers/new' do

        erb :'/customers/new'
    end

    post '/customers' do
        binding.pry

    end

end
