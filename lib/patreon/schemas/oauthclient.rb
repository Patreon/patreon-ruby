# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module OAuthClient
      Name = 'oauthclient'

      class Attributes
        include Utils::Enum

        define :CLIENT_SECRET, 'client_secret'
        define :NAME, 'name'
        define :DESCRIPTION, 'description'
        define :AUTHOR_NAME, 'author_name'
        define :DOMAIN, 'domain'
        define :VERSION, 'version'
        define :ICON_URL, 'icon_url'
        define :PRIVACY_POLICY_URL, 'privacy_policy_url'
        define :TOS_URL, 'tos_url'
        define :REDIRECT_URIS, 'redirect_uris'
        define :DEFAULT_SCOPES, 'default_scopes'
        define :CATEGORY, 'category'
      end

      class Relationships
        include Utils::Enum

        define :USER, 'user'
        define :CAMPAIGN, 'campaign'
        define :CREATOR_TOKEN, 'creator_token'
        define :APPS, 'apps'
      end
    end
  end
end