# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  module Schemas
    module Benefit
      Name = 'benefit'

      class Attributes
        include Utils::Enum

        define :TITLE, 'title'
        define :DESCRIPTION, 'description'
        define :BENEFIT_TYPE, 'benefit_type'
        define :RULE_TYPE, 'rule_type'
        define :CREATED_AT, 'created_at'
        define :DELIVERED_DELIVERABLES_COUNT, 'delivered_deliverables_count'
        define :NOT_DELIVERED_DELIVERABLES_COUNT, 'not_delivered_deliverables_count'
        define :DELIVERABLES_DUE_TODAY_COUNT, 'deliverables_due_today_count'
        define :NEXT_DELIVERABLE_DUE_DATE, 'next_deliverable_due_date'
        define :TIERS_COUNT, 'tiers_count'
        define :IS_DELETED, 'is_deleted'
        define :IS_PUBLISHED, 'is_published'
        define :IS_ENDED, 'is_ended'
        define :APP_EXTERNAL_ID, 'app_external_id'
        define :APP_META, 'app_meta'
      end

      class Relationships
        include Utils::Enum

        define :TIERS, 'tiers'
        define :DELIVERABLES, 'deliverables'
        define :CAMPAIGN, 'campaign'
        define :CAMPAIGN_INSTALLATION, 'campaign_installation'
      end
    end
  end
end