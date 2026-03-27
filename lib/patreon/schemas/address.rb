# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module Address
      Name = 'address'

      class Attributes
        include Utils::Enum

        define :ADDRESSEE, 'addressee'
        define :LINE_1, 'line_1'
        define :LINE_2, 'line_2'
        define :POSTAL_CODE, 'postal_code'
        define :CITY, 'city'
        define :STATE, 'state'
        define :COUNTRY, 'country'
        define :PHONE_NUMBER, 'phone_number'
        define :CREATED_AT, 'created_at'
      end

      class Relationships
        include Utils::Enum

        define :USER, 'user'
        define :CAMPAIGNS, 'campaigns'
      end
    end
  end
end