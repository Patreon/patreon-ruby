module Patreon
  module Schemas
    module Goal
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
      end

      class Relationships
        include Utils::Enum

        define :CREATOR, 'creator'
      end

      class << self
        def default_attributes
          [
            Attributes::AMOUNT_CENTS,
            Attributes::USER_LIMIT,
            Attributes::REMAINING,
            Attributes::DESCRIPTION,
            Attributes::REQUIRES_SHIPPING,
            Attributes::CREATED_AT,
            Attributes::URL,
            Attributes::PATRON_COUNT,
          ]
        end

        def default_relationships
          [
            Relationships::CREATOR
          ]
        end
      end
    end
  end
end
