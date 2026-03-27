# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module Deliverable
      Name = 'deliverable'

      class Attributes
        include Utils::Enum

        define :COMPLETED_AT, 'completed_at'
        define :DELIVERY_STATUS, 'delivery_status'
        define :DUE_AT, 'due_at'
      end

      class Relationships
        include Utils::Enum

        define :CAMPAIGN, 'campaign'
        define :BENEFIT, 'benefit'
        define :MEMBER, 'member'
        define :USER, 'user'
      end
    end
  end
end