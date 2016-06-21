# patreon-ruby
Interact with the Patreon API via OAuth.

Get the gem from [RubyGems](https://rubygems.org/gems/patreon)

Step 1. Get your client_id and client_secret
---
Visit the [OAuth Documentation Page](http://patreon.com/oauth2/documentation)
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

Step 3. (Optional) Customize your usage
---
`Patreon::API` instances have four methods:
* `fetch_user(includes=nil, fields=nil)`
* `fetch_campaign(includes=nil, fields=nil)`
* `fetch_campaign_and_patrons(includes=nil, fields=nil)`
* `fetch_page_of_pledges(campaign_id, page_size, cursor=nil, includes=nil, fields=nil)`

The `includes` and `fields` arguments to these methods specify
the [related resources](http://jsonapi.org/format/#fetching-includes)
and the [resource attributes](http://jsonapi.org/format/#fetching-sparse-fieldsets)
you want returned by our API, as per the [JSON:API specification](http://jsonapi.org/).
The lists of valid `includes` and `fields` arguments are provided on `Patreon::Schemas`.
For instance, if you wanted to request the total amount a patron has ever paid to your campaign,
which is not included by default, you could do:
```ruby
api_client = Patreon::API.new(patron_access_token)
patron_response = api_client.fetch_user(nil, {
  'pledge': Patreon::Schemas::Pledge.default_attributes + [Patreon::Schemas::Pledge::Attributes::TOTAL_HISTORICAL_AMOUNT_CENTS]
})
```
