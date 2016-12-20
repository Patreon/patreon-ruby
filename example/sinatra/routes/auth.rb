require_relative '../models/manager/patreon_user_mgr'
require 'patreon'

class MyApp < Sinatra::Application
  get '/' do
    # https://www.patreon.com/platform/documentation/oauth -- Step 1
    # The landing page links to patreon.com/oauth2/authorize so the user can authorize this app to access their Patreon data.
    @log_in_url = (
        "https://www.patreon.com/oauth2/authorize" \
        "?response_type=code" \
        "&client_id=%{client_id}" \
        "&redirect_uri=%{redirect_uri}"
    ) % {
        :client_id => MyConfig::PATREON_CLIENT_ID,
        :redirect_uri => MyConfig::PATREON_REDIRECT_URI
    }
    haml :login
  end

  get '/oauth/redirect' do
    # https://www.patreon.com/platform/documentation/oauth -- Step 2
    # After authorizing this app to access their Patreon data, the user is redirected back here.

    # https://www.patreon.com/platform/documentation/oauth -- Step 3
    # Use the code provided as a query parameter to get the user's access token and refresh token
    oauth_client = Patreon::OAuth.new(MyConfig::PATREON_CLIENT_ID, MyConfig::PATREON_CLIENT_SECRET)
    tokens = oauth_client.get_tokens(params['code'], 'http://localhost:4567/oauth/redirect')

    # https://www.patreon.com/platform/documentation/oauth -- Step 4
    # Save off the user's tokens and fetch their Patreon data.
    user = PatreonUserManager.create_or_update_user_with_tokens(
      patreon_refresh_token=tokens['refresh_token'],
      patreon_access_token=tokens['access_token']
    )

    # https://www.patreon.com/platform/documentation/oauth -- Step 5
    # If the user signed in successfully, take them to their profile page.
    halt 403 unless user
    redirect to("/users/%{user_id}" % {:user_id => user.user_id})
  end

  get '/users/:user_id' do
    @user = User.get(params['user_id'])
    halt 404 unless @user
    haml :profile
  end
end
