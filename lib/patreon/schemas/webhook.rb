# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module Webhook
      Name = 'webhook'

      class Attributes
        include Utils::Enum

        define :TRIGGERS, 'triggers'
        define :URI, 'uri'
        define :PAUSED, 'paused'
        define :LAST_ATTEMPTED_AT, 'last_attempted_at'
        define :NUM_CONSECUTIVE_TIMES_FAILED, 'num_consecutive_times_failed'
        define :SECRET, 'secret'
      end

      class Relationships
        include Utils::Enum

        define :CLIENT, 'client'
        define :CAMPAIGN, 'campaign'
      end
    end
  end
end