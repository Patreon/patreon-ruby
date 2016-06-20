require_relative '../utils/enum'

module Patreon
  module Schemas
    module Pledge
      class Attributes
        include Utils::Enum

        define :AMOUNT_CENTS, 'amount_cents'
        define :TOTAL_HISTORICAL_AMOUNT_CENTS, 'total_historical_amount_cents'
        define :DECLINED_SINCE, 'declined_since'
        define :CREATED_AT, 'created_at'
        define :PLEDGE_CAP_CENTS, 'pledge_cap_cents'
        define :PATRON_PAYS_FEES, 'patron_pays_fees'
        define :UNREAD_COUNT, 'unread_count'
      end

      class Relationships
        include Utils::Enum

        define :PATRON, 'patron'
        define :REWARD, 'reward'
        define :CREATOR, 'creator'
        define :ADDRESS, 'address'
        define :CARD, 'card'
        define :PLEDGE_VAT_LOCATION, 'pledge_vat_location'
      end

      class << self
        def default_attributes
          [
            Attributes::AMOUNT_CENTS,
            Attributes::DECLINED_SINCE,
            Attributes::CREATED_AT,
            Attributes::PLEDGE_CAP_CENTS,
            Attributes::PATRON_PAYS_FEES,
          ]
        end

        def default_relationships
          [
            Relationships::PATRON,
            Relationships::REWARD,
            Relationships::CREATOR,
            Relationships::ADDRESS,
            Relationships::PLEDGE_VAT_LOCATION,
          ]
        end
      end
    end
  end
end
