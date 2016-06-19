require_relative '../../enum/enum'

module Patreon
  module Schemas
    module User
      class Attributes
        include Enum

        define :EMAIL, 'email'
        define :FIRST_NAME, 'first_name'
        define :LAST_NAME, 'last_name'
        define :FULL_NAME, 'full_name'
        define :GENDER, 'gender'
        define :STATUS, 'status'
        define :VANITY, 'vanity'
        define :ABOUT, 'about'
        define :FACEBOOK_ID, 'facebook_id'
        define :IMAGE_URL, 'image_url'
        define :THUMB_URL, 'thumb_url'
        define :THUMBNAILS, 'thumbnails'
        define :YOUTUBE, 'youtube'
        define :TWITTER, 'twitter'
        define :FACEBOOK, 'facebook'
        define :TWITCH, 'twitch'
        define :IS_SUSPENDED, 'is_suspended'
        define :IS_DELETED, 'is_deleted'
        define :IS_NUKED, 'is_nuked'
        define :CREATED, 'created'
        define :URL, 'url'
        define :LIKE_COUNT, 'like_count'
        define :COMMENT_COUNT, 'comment_count'
        define :IS_CREATOR, 'is_creator'
        define :HIDE_PLEDGES, 'hide_pledges'
        define :TWO_FACTOR_ENABLED, 'two_factor_enabled'
      end

      class Relationships
        include Enum

        define :PLEDGES, 'pledges'
        define :CARDS, 'cards'
        define :FOLLOWS, 'follows'
        define :CAMPAIGN, 'campaign'
        define :PRESENCE, 'presence'
        define :SESSION, 'session'
        define :LOCATIONS, 'locations'
        define :CURRENT_USER_FOLLOW, 'current_user_follow'
        define :PLEDGE_TO_CURRENT_USER, 'pledge_to_current_user'
      end

      class << self
        def default_attributes
          [
            Attributes::EMAIL,
            Attributes::FIRST_NAME,
            Attributes::LAST_NAME,
            Attributes::FULL_NAME,
            Attributes::GENDER,
            Attributes::STATUS,
            Attributes::VANITY,
            Attributes::ABOUT,
            Attributes::FACEBOOK_ID,
            Attributes::IMAGE_URL,
            Attributes::THUMB_URL,
            Attributes::THUMBNAILS,
            Attributes::YOUTUBE,
            Attributes::TWITTER,
            Attributes::FACEBOOK,
            Attributes::TWITCH,
            Attributes::IS_SUSPENDED,
            Attributes::IS_DELETED,
            Attributes::IS_NUKED,
            Attributes::CREATED,
            Attributes::URL,
          ]
        end

        def default_relationships
          [
            Relationships::CAMPAIGN,
            Relationships::PLEDGES,
          ]
        end
      end
    end
  end
end
