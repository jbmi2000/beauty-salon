class AppointmentsController < ApplicationController

    get '/customers/:id/new' do
        @user = Helpers.current_user(session)
         
        @c=Customer.find(params[:id])
        # @c.split().find_by(#{@c.id})
        # binding.pry
        erb :'/appointments/new'
      end

    get '/appointments' do
        
        erb :'/appointments/show'
      end

    post '/appointments' do
        
         @user = Helpers.current_user(session)
         @c=params[:customer_id]
         #binding.pry
        # @c=Customer.find(:id)
        # @c.appointments.create()
        # @u=User.id
        
        # @a = Appointment.create(@user_id: @u, @customer_id: @c, appointment_date: Date.today)
    redirect '/appointments'
    end




end
