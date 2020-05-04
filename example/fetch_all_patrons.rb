require_relative '../lib/patreon'
require 'uri'
require 'cgi'

# API key constants. Register at https://www.patreon.com/platform to get these values
# client_id = nil
# client_secret = nil
# redirect_uri = nil
# refresh_token = nil # your Creator Refresh Token

# Fetching updated tokens
oauth_client = Patreon::OAuth.new(client_id, client_secret)
tokens = oauth_client.refresh_token(refresh_token, redirect_uri)
access_token = tokens['access_token']

# Fetching basic data
api_client = Patreon::API.new(access_token)

Member = Patreon::Schemas::Member

campaign_response = api_client.get_campaigns()
campaign_id = campaign_response.data[0].id

# Fetching all pledges
all_members = []
cursor = nil
while true do
    page_response = api_client.get_campaigns_by_id_members(campaign_id, { 
        :count => 25, 
        :cursor => cursor,
        # In v2 you need to specify the fields that you are requesting
        fields: {
            Member::Name => [
                Member::Attributes::FULL_NAME, 
                Member::Attributes::LIFETIME_SUPPORT_CENTS,
            ],
        }
    })
    all_members += page_response.data
    next_page_link = page_response.links[page_response.data]['next']
    if next_page_link
        parsed_query = CGI::parse(next_page_link)
        cursor = parsed_query['page[cursor]'][0]
    else
        break
    end
end

# Mapping to all patrons. Feel free to customize as needed.
# As with all standard Ruby objects, (member.methods - Object.methods) will list the available attributes and relationships
puts all_members.map{ |member| { full_name: member.full_name, lifetime_support_cents: member.lifetime_support_cents } }