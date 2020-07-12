class AppointmentsController < ApplicationController

    get '/appointments/new' do
        @user = Helpers.current_user(session)
        # binding.pry
        @customer=Customer.first
        erb :'/appointments/new'
      end

    get '/appointments' do
        
        erb :'/appointments/show'
    end

    post '/appointments' do
         @user = Helpers.current_user(session)
         @c=Customer.find_by(params[:id])
        # @u=User.id
        binding.pry
        # @a = Appointment.create(@user_id: @u, @customer_id: @c, appointment_date: Date.today)
    redirect '/appointments'
    end




end
