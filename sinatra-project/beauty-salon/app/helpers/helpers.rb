class Helpers

    def self.current_user(session)
        @user = User.find_by(id: session[:user_id])  
        #currently logged in user from session hash
    end

    def self.is_logged_in?(session)
        session[:user_id] ? true : false  
        #is there a user ID key in the session hash
    end

    def current_user
        User.find_by(id: session[user_id])

    end

   # Trying to validate user to allow for edit, update, delete actions on information

   # @c.user == current_user if true then perform action else redirect back to show page

    # def self.user_customer
    #     @c=@user.customers
    #      # binding.pry
    #     if !( @c.ids.include?(@user.id))
    #         @error = "This is not your customer"
    #         redirect '/customers/index'
    #         #do something
       
    #     end
    # end

    # username
    # customer



end
