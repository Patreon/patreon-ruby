# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module Tier
      Name = 'tier'

      class Attributes
        include Utils::Enum

        define :AMOUNT_CENTS, 'amount_cents'
        define :USER_LIMIT, 'user_limit'
        define :REMAINING, 'remaining'
        define :DESCRIPTION, 'description'
        define :REQUIRES_SHIPPING, 'requires_shipping'
        define :CREATED_AT, 'created_at'
        define :URL, 'url'
        define :PATRON_COUNT, 'patron_count'
        define :POST_COUNT, 'post_count'
        define :DISCORD_ROLE_IDS, 'discord_role_ids'
        define :TITLE, 'title'
        define :IMAGE_URL, 'image_url'
        define :EDITED_AT, 'edited_at'
        define :PUBLISHED, 'published'
        define :PUBLISHED_AT, 'published_at'
        define :UNPUBLISHED_AT, 'unpublished_at'
      end

      class Relationships
        include Utils::Enum

        define :CAMPAIGN, 'campaign'
        define :TIER_IMAGE, 'tier_image'
        define :BENEFITS, 'benefits'
      end
    end
  end
end