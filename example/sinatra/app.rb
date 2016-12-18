require 'sinatra/base'

class MyApp < Sinatra::Application
  enable :sessions
  set :session_secret, 'my app has a secret'
end

class MyConfig
  # Fill all this out with your information
  PATREON_CLIENT_ID = nil
  PATREON_CLIENT_SECRET = nil
  PATREON_CREATOR_ID = nil
  PATREON_REDIRECT_URI = nil
end

require_relative 'models/table/init'
require_relative 'routes/init'

MyApp.run! if MyApp.app_file == $0
