# from http://code.dblock.org/2011/03/16/how-to-define-enums-in-ruby.html

module Patreon
  module Utils
    module Enum
      def initialize(key, value)
        @key = key
        @value = value
      end

      def key
        @key
      end

      def value
        @value
      end

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
        def define(key, value)
          @hash ||= {}
          @hash[key] = self.new(key, value)
        end

        def const_missing(key)
          @hash[key].value
        end

        def each
          @hash.each do |key, value|
            yield key, value
          end
        end

        def all
          @hash.values
        end

        def all_to_hash
          hash = {}
          each do |key, value|
            hash[key] = value.value
          end
          hash
        end
      end
    end
  end
end
