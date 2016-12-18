require "data_mapper"

class User
  include DataMapper::Resource

  property :user_id, Serial
  property :full_name, String
  property :email, String
  property :patreon_pledge_amount_cents, Integer
  property :patreon_user_id, String
  property :patreon_refresh_token, String
  property :patreon_access_token, String
end
