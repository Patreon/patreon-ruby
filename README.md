# patreon-ruby
Interact with the Patreon API via OAuth.

Get the gem from [RubyGems](https://rubygems.org/gems/patreon)

Step 1. Get your client_id and client_secret
---
Visit the [OAuth Documentation Page](https://patreon.com/oauth2/documentation)
while logged in as a Patreon creator to register your client.

This will provide you with a `client_id` and a `client_secret`.

Step 2. Use this library
---
e.g., in a Rails route
```ruby
require 'patreon'

class OAuthController < ApplicationController
  def redirect
    oauth_client = Patreon::OAuth.new(client_id, client_secret)
    tokens = oauth_client.get_tokens(params[:code], redirect_uri)
    access_token = tokens['access_token']

    api_client = Patreon::API.new(access_token)
    user_response = api_client.fetch_user()
    @user = user_response['data']
    included = user_response['included']
    if included
      @pledge = included.find {|obj| obj['type'] == 'pledge' && obj['relationships']['creator']['data']['id'] == creator_id}
      @campaign = included.find {|obj| obj['type'] == 'campaign' && obj['relationships']['creator']['data']['id'] == creator_id}
    else
      @pledge = nil
      @campaign = nil
    end
  end
end
```
