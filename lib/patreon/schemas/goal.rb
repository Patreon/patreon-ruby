# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module Goal
      Name = 'goal'

      class Attributes
        include Utils::Enum

        define :AMOUNT_CENTS, 'amount_cents'
        define :TITLE, 'title'
        define :DESCRIPTION, 'description'
        define :CREATED_AT, 'created_at'
        define :REACHED_AT, 'reached_at'
        define :COMPLETED_PERCENTAGE, 'completed_percentage'
      end

      class Relationships
        include Utils::Enum

        define :CAMPAIGN, 'campaign'
      end
    end
  end
end