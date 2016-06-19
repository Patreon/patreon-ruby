require_relative '../../enum/enum'

module Patreon
  module Schemas
    module Campaign
      class Attributes
        include Enum

        define :SUMMARY, 'summary'
        define :CREATION_NAME, 'creation_name'
        define :PAY_PER_NAME, 'pay_per_name'
        define :ONE_LINER, 'one_liner'
        define :MAIN_VIDEO_EMBED, 'main_video_embed'
        define :MAIN_VIDEO_URL, 'main_video_url'
        define :IMAGE_SMALL_URL, 'image_small_url'
        define :IMAGE_URL, 'image_url'
        define :THANKS_VIDEO_URL, 'thanks_video_url'
        define :THANKS_EMBED, 'thanks_embed'
        define :THANKS_MSG, 'thanks_msg'
        define :IS_MONTHLY, 'is_monthly'
        define :IS_NSFW, 'is_nsfw'
        define :IS_CHARGED_IMMEDIATELY, 'is_charged_immediately'
        define :IS_CHARGE_UPFRONT_ELIGIBLE, 'is_charge_upfront_eligible'
        define :IS_PLURAL, 'is_plural'
        define :CREATED_AT, 'created_at'
        define :PUBLISHED_AT, 'published_at'
        define :PLEDGE_URL, 'pledge_url'
        define :PLEDGE_SUM, 'pledge_sum'
        define :PATRON_COUNT, 'patron_count'
        define :CREATION_COUNT, 'creation_count'
        define :OUTSTANDING_PAYMENT_AMOUNT_CENTS, 'outstanding_payment_amount_cents'
      end

      class Relationships
        include Enum

        define :REWARDS, 'rewards'
        define :CREATOR, 'creator'
        define :GOALS, 'goals'
        define :PLEDGES, 'pledges'
        define :CURRENT_USER_PLEDGE, 'current_user_pledge'
        define :POST_AGGREGATION, 'post_aggregation'
        define :CATEGORIES, 'categories'
        define :PREVIEW_TOKEN, 'preview_token'
      end

      class << self
        def default_attributes
          [
            Attributes::SUMMARY,
            Attributes::CREATION_NAME,
            Attributes::PAY_PER_NAME,
            Attributes::ONE_LINER,
            Attributes::MAIN_VIDEO_EMBED,
            Attributes::MAIN_VIDEO_URL,
            Attributes::IMAGE_SMALL_URL,
            Attributes::IMAGE_URL,
            Attributes::THANKS_VIDEO_URL,
            Attributes::THANKS_EMBED,
            Attributes::THANKS_MSG,
            Attributes::IS_MONTHLY,
            Attributes::IS_NSFW,
            Attributes::IS_CHARGED_IMMEDIATELY,
            Attributes::IS_PLURAL,
            Attributes::CREATED_AT,
            Attributes::PUBLISHED_AT,
            Attributes::PLEDGE_URL,
            Attributes::PLEDGE_SUM,
            Attributes::PATRON_COUNT,
            Attributes::CREATION_COUNT,
            Attributes::OUTSTANDING_PAYMENT_AMOUNT_CENTS,
          ]
        end

        def default_relationships
          [
            Relationships::REWARDS,
            Relationships::CREATOR,
            Relationships::GOALS,
          ]
        end
      end
    end
  end
end
