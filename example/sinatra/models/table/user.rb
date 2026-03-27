require "data_mapper"

class User
  include DataMapper::Resource

  property :user_id, Serial
  property :full_name, String
  property :email, String
  property :lifetime_support_cents, Integer
  property :patreon_user_id, String
  property :patreon_refresh_token, String
  property :patreon_access_token, String
end
