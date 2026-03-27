# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module User
      Name = 'user'

      class Attributes
        include Utils::Enum

        define :EMAIL, 'email'
        define :FIRST_NAME, 'first_name'
        define :LAST_NAME, 'last_name'
        define :FULL_NAME, 'full_name'
        define :IS_EMAIL_VERIFIED, 'is_email_verified'
        define :VANITY, 'vanity'
        define :ABOUT, 'about'
        define :IMAGE_URL, 'image_url'
        define :THUMB_URL, 'thumb_url'
        define :CAN_SEE_NSFW, 'can_see_nsfw'
        define :CREATED, 'created'
        define :URL, 'url'
        define :LIKE_COUNT, 'like_count'
        define :HIDE_PLEDGES, 'hide_pledges'
        define :SOCIAL_CONNECTIONS, 'social_connections'
      end

      class Relationships
        include Utils::Enum

        define :MEMBERSHIPS, 'memberships'
        define :CAMPAIGN, 'campaign'
      end
    end
  end
end