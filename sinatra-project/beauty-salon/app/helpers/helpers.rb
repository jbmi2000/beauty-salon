class Helpers

    def self.current_user(session)
        @u = User.find_by(id: session[:user_id])  
        #currently logged in user from session hash
    end

    def self.is_logged_in?(session)
        session[:user_id] ? true : false  
        #is there a user ID key in the session hash
    end

    def current_user
        User.find_by(id: session[user_id])

    end


end
