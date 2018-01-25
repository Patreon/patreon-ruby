require 'rbconfig'

module Patreon
  module Utils
    module Client
      def self.user_agent_string
        "Patreon-Ruby, version #{Patreon::VERSION}, platform #{RbConfig::CONFIG['host']}"
      end
    end
  end
end