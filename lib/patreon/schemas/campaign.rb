# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module Campaign
      Name = 'campaign'

      class Attributes
        include Utils::Enum

        define :SUMMARY, 'summary'
        define :CREATION_NAME, 'creation_name'
        define :PAY_PER_NAME, 'pay_per_name'
        define :ONE_LINER, 'one_liner'
        define :MAIN_VIDEO_EMBED, 'main_video_embed'
        define :MAIN_VIDEO_URL, 'main_video_url'
        define :IMAGE_URL, 'image_url'
        define :IMAGE_SMALL_URL, 'image_small_url'
        define :THANKS_VIDEO_URL, 'thanks_video_url'
        define :THANKS_EMBED, 'thanks_embed'
        define :THANKS_MSG, 'thanks_msg'
        define :IS_MONTHLY, 'is_monthly'
        define :HAS_RSS, 'has_rss'
        define :HAS_SENT_RSS_NOTIFY, 'has_sent_rss_notify'
        define :RSS_FEED_TITLE, 'rss_feed_title'
        define :RSS_ARTWORK_URL, 'rss_artwork_url'
        define :IS_NSFW, 'is_nsfw'
        define :IS_CHARGED_IMMEDIATELY, 'is_charged_immediately'
        define :CREATED_AT, 'created_at'
        define :PUBLISHED_AT, 'published_at'
        define :PLEDGE_URL, 'pledge_url'
        define :PATRON_COUNT, 'patron_count'
        define :DISCORD_SERVER_ID, 'discord_server_id'
        define :GOOGLE_ANALYTICS_ID, 'google_analytics_id'
        define :SHOW_EARNINGS, 'show_earnings'
        define :VANITY, 'vanity'
        define :URL, 'url'
      end

      class Relationships
        include Utils::Enum

        define :TIERS, 'tiers'
        define :CREATOR, 'creator'
        define :BENEFITS, 'benefits'
        define :GOALS, 'goals'
        define :CAMPAIGN_INSTALLATIONS, 'campaign_installations'
      end
    end
  end
end