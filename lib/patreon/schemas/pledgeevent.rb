# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module PledgeEvent
      Name = 'pledgeevent'

      class Attributes
        include Utils::Enum

        define :TYPE, 'type'
        define :DATE, 'date'
        define :PAYMENT_STATUS, 'payment_status'
        define :TIER_TITLE, 'tier_title'
        define :TIER_ID, 'tier_id'
        define :AMOUNT_CENTS, 'amount_cents'
        define :CURRENCY_CODE, 'currency_code'
      end

      class Relationships
        include Utils::Enum

        define :PATRON, 'patron'
        define :CAMPAIGN, 'campaign'
      end
    end
  end
end