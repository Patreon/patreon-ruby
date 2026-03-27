# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module Post
      Name = 'post'

      class Attributes
        include Utils::Enum

        define :TITLE, 'title'
        define :CONTENT, 'content'
        define :IS_PAID, 'is_paid'
        define :IS_PUBLIC, 'is_public'
        define :PUBLISHED_AT, 'published_at'
        define :URL, 'url'
        define :EMBED_DATA, 'embed_data'
        define :EMBED_URL, 'embed_url'
        define :APP_ID, 'app_id'
        define :APP_STATUS, 'app_status'
      end

      class Relationships
        include Utils::Enum

        define :USER, 'user'
        define :CAMPAIGN, 'campaign'
      end
    end
  end
end