require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions  # <<--retains loggged in user information in a hash accessible by calling sessions (sessions on server/cookies in browser)
    set :session_secret, ENV['SESSION_SECRET'] # "secret"  since server is restarted everytime shotgun is run.  creates same session ID based on "secret"
  end



  get "/" do
    erb :welcome
  end

end
