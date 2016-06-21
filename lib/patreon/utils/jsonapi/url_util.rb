require 'uri'

module Patreon
  module Utils
    module JSONAPI
      class URLUtil
        def self.build_url(path, includes=nil, fields=nil)
          connector = path.include?('?') ? '&' : '?'
          params = {}
          if includes
            params.merge!({ 'include' => joined_or_null(includes) })
          end
          if fields
            params.merge!(fields.reduce({}) {|memo, type_attributes|
              type, attributes = type_attributes
              memo.merge({ "fields[#{type}]" => joined_or_null(attributes) })
            })
          end
          return "#{path}#{connector}#{URI.encode_www_form(params)}"
        end

        private

        def self.joined_or_null(list)
          list.length == 0 ? "null" : list.join(',')
        end
      end
    end
  end
end
