# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module Member
      Name = 'member'

      class Attributes
        include Utils::Enum

        define :PATRON_STATUS, 'patron_status'
        define :IS_FOLLOWER, 'is_follower'
        define :FULL_NAME, 'full_name'
        define :EMAIL, 'email'
        define :PLEDGE_RELATIONSHIP_START, 'pledge_relationship_start'
        define :LIFETIME_SUPPORT_CENTS, 'lifetime_support_cents'
        define :CURRENTLY_ENTITLED_AMOUNT_CENTS, 'currently_entitled_amount_cents'
        define :LAST_CHARGE_DATE, 'last_charge_date'
        define :LAST_CHARGE_STATUS, 'last_charge_status'
        define :NOTE, 'note'
        define :WILL_PAY_AMOUNT_CENTS, 'will_pay_amount_cents'
      end

      class Relationships
        include Utils::Enum

        define :ADDRESS, 'address'
        define :CAMPAIGN, 'campaign'
        define :CURRENTLY_ENTITLED_TIERS, 'currently_entitled_tiers'
        define :USER, 'user'
        define :PLEDGE_HISTORY, 'pledge_history'
      end
    end
  end
end