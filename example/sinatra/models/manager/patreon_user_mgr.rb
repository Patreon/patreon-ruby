require 'patreon'

class PatreonUserManager
  def self.create_or_update_user_with_tokens(patreon_refresh_token, patreon_access_token)
    # https://www.patreon.com/platform/documentation/oauth -- Step 4
    # Use the tokens to fetch the Patreon profile and pledge data, saving it all to the db.

    return nil unless patreon_refresh_token and patreon_access_token

    # Make the API client with the patron's access token
    api_client = Patreon::API.new(patreon_access_token)

    # Get the patron's profile info and pledge amount
    user_response = api_client.get_identity({
      # In v2 you need to specify the fields that you are requesting
      includes: [Patreon::Schemas::User::Relationships::MEMBERSHIPS],
      fields: {
        Patreon::Schemas::User::Name => [
          Patreon::Schemas::User::Attributes::FULL_NAME,
          Patreon::Schemas::User::Attributes::EMAIL,
        ],
        Patreon::Schemas::Member::Name => [
          Patreon::Schemas::Member::Attributes::LIFETIME_SUPPORT_CENTS
        ]
    }
    })
    patreon_user_data = user_response.data
    return nil unless patreon_user_data

    # Find or make the user, and set their information using the API response
    db_user = User.first_or_create({:patreon_user_id => patreon_user_data.id})
    update_data = {
      :full_name => patreon_user_data.full_name,
      :email => patreon_user_data.email,
      :patreon_refresh_token => patreon_refresh_token,
      :patreon_access_token => patreon_access_token
    }
    # If you request `memberships` and DON’T have the `identity.memberships` scope, 
    # you will receive data about the user’s membership to your campaign.
    if patreon_user_data.memberships.length > 0
      update_data[:lifetime_support_cents] = patreon_user_data.memberships[0].lifetime_support_cents
    end
    db_user.update(update_data)

    # Return the user we've made or updated
    return db_user
  end
end
