# patreon-ruby
Interact with the Patreon API via OAuth.

## Important notice about updating to 1.0.0 from earlier versions

Patreon Ruby library version 1.0.0 moves on to Patreon's v2 API, which is not compatible with old v1 calls. Therefore directly upgrading from older versions to 1.0.0 would break compatibility of your installation. APIv1 will be deprecated some time soon after APIv2 comes out of beta, so it's important to get your integration compatible with API v2. 

For more information on the differences and similarities between v1 and v2, check out: https://docs.patreon.com/#what-39-s-new

## Getting started

Get the gem from [RubyGems](https://rubygems.org/gems/patreon)

Step 1. Get your client_id and client_secret
---
Visit the [OAuth Documentation Page](http://patreon.com/oauth2/documentation)
while logged in as a Patreon creator to register your client.

This will provide you with a `client_id` and a `client_secret`.

Step 2. Use this library

e.g. [the example Sinatra app in this repo](example/sinatra/README.md) or the Rails route example below.

---
```ruby
require 'patreon'

class OAuthController < ApplicationController
  def redirect
    oauth_client = Patreon::OAuth.new(client_id, client_secret)
    tokens = oauth_client.get_tokens(params[:code], redirect_uri)
    access_token = tokens['access_token']

    api_client = Patreon::API.new(access_token)
    user_response = api_client.fetch_user()
    # user_response uses [json-api-vanilla](https://github.com/trainline/json-api-vanilla) for easy usage
    @user = user_response.data
    # you can list all attributes and relationships with (@user.methods - Object.methods)
    @pledge = @user.pledges[0]
    # just like with @user, you can list all pledge attributes and relationships with (@pledge.methods - Object.methods)
    @pledge_amount = @pledge.amount_cents
  end
end
```

Step 3. (Optional) Customize your usage
---
`Patreon::API` instances have the following methods:
<!--
This list is auto-generated from the same code that generates
https://docs.patreon.com.
-->
* `get_campaigns(opts = { includes: [], fields: [],  count: 10, cursor: nil})`
* `get_identity(opts = { includes: [], fields: [], })`
* `get_webhooks(opts = { includes: [], fields: [],  count: 10, cursor: nil})`
* `get_campaigns_by_id_members(resource_id, opts = { includes: [], fields: [],  count: 10, cursor: nil})`
* `get_campaigns_by_id(resource_id, opts = { includes: [], fields: [], })`
* `get_webhooks_by_id(resource_id, opts = { includes: [], fields: [], })`
* `get_members_by_id(resource_id, opts = { includes: [], fields: [], })`

The `includes` and `fields` arguments to these methods specify
the [related resources](http://jsonapi.org/format/#fetching-includes)
and the [resource attributes](http://jsonapi.org/format/#fetching-sparse-fieldsets)
you want returned by our API, as per the [JSON:API specification](http://jsonapi.org/).
The lists of valid `includes` and `fields` arguments are provided on `Patreon::Schemas`.

For instance, if you wanted to request the first name and total amount a patron has ever paid to your campaign, you could do:
```ruby
api_client = Patreon::API.new(patron_access_token)

User = Patreon::Schemas::User
Member = Patreon::Schemas::Member

patron_response = api_client.get_identity({
    includes: [User::Relationships::MEMBERSHIPS],
    fields: {
        User::Name => User::Attributes::FIRST_NAME,
        Member::Name => Member::Attributes::LIFETIME_SUPPORT_CENTS
    }
})
```
Which would return:
```json
{
    "data": {
        "attributes": {
            "first_name": "Jack"
        },
        "id": "1234",
        "relationships": {
            "memberships": {
                "data": [
                    {
                        "id": "960d87e4-49ab-4828-b411-8ba9f91c6d81",
                        "type": "member"
                    }
                ]
            }
        },
        "type": "user"
    },
    "included": [
        {
            "attributes": {
                "lifetime_support_cents": 500
            },
            "id": "960d87e4-49ab-4828-b411-8ba9f91c6d81",
            "type": "member"
        }
    ],
    "links": {
        "self": "https://www.patreon.com/api/oauth2/v2/user/1234"
    }
}
```
