require 'patreon'

class PatreonUserManager
  def self.create_or_update_user_with_tokens(patreon_refresh_token, patreon_access_token)
    # https://www.patreon.com/platform/documentation/oauth -- Step 4
    # Use the tokens to fetch the Patreon profile and pledge data, saving it all to the db.

    return nil unless patreon_refresh_token and patreon_access_token

    # Make the API client with the patron's access token
    api_client = Patreon::API.new(patreon_access_token)

    # Get the patron's profile info and pledge amount
    user_response = api_client.fetch_user()
    patreon_user_data = user_response.data
    return nil unless patreon_user_data

    # Find or make the user, and set their information using the API response
    db_user = User.first_or_create({:patreon_user_id => patreon_user_data.id})
    db_user.update({
      :full_name => patreon_user_data.full_name,
      :email => patreon_user_data.email,
      :patreon_refresh_token => patreon_refresh_token,
      :patreon_access_token => patreon_access_token
    })

    # Find the user's pledge to us, and if they have one, update their pledge amount in our db
    # puts user_response.data.methods
    pledges = (user_response.find_all('pledge') || [])
    pledge = pledges.find {|obj|
      obj.creator.id == MyConfig::PATREON_CREATOR_ID
    }
    if pledge
      db_user.update({
          :patreon_pledge_amount_cents => pledge.amount_cents
      })
    end

    # Return the user we've made or updated
    return db_user
  end
end
