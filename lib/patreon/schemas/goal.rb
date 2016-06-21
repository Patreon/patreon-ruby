module Patreon
  module Schemas
    module Goal
      class Attributes
        include Utils::Enum

        define :AMOUNT_CENTS, 'amount_cents'
        define :TITLE, 'title'
        define :DESCRIPTION, 'description'
        define :CREATED_AT, 'created_at'
        define :REACHED_AT, 'reached_at'
      end

      class Relationships
      end

      class << self
        def default_attributes
          [
            Attributes::AMOUNT_CENTS,
            Attributes::TITLE,
            Attributes::DESCRIPTION,
            Attributes::CREATED_AT,
            Attributes::REACHED_AT,
          ]
        end

        def default_relationships
          [
          ]
        end
      end
    end
  end
end
