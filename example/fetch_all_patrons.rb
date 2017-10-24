require_relative 'lib/patreon'
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

campaign_response = api_client.fetch_campaign()
campaign_id = campaign_response.data[0].id

# Fetching all pledges
all_pledges = []
cursor = nil
while true do
    page_response = api_client.fetch_page_of_pledges(campaign_id, 25, cursor)
    all_pledges += page_response.data
    next_page_link = page_response.links[page_response.data]['next']
    if next_page_link
        parsed_query = CGI::parse(next_page_link)
        cursor = parsed_query['page[cursor]'][0]
    else
        break
    end
end

# Mapping to all patrons. Feel free to customize as needed.
# As with all standard Ruby objects, (pledge.methods - Object.methods) will list the available attributes and relationships
puts all_pledges.map{ |pledge| { full_name: pledge.patron.full_name, amount_cents: pledge.amount_cents } }
