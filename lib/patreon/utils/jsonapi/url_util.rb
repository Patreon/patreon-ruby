require 'rack'
require 'uri'

module Patreon
  module Utils
    module JSONAPI
      class URLUtil
        def self.build_url(url, includes=nil, fields=nil, count=(count_not_passed = true; nil), cursor=nil)
          parsed_url = URI.parse(url)
          params = parsed_url.query ? Rack::Utils.parse_query(parsed_url.query) : {}
          params['include'] = joined_or_null(includes) if includes
          fields.each do |name, val|
            params["fields[#{name}]"] = val
          end if fields
          params["page[count]"] = (count || 10) unless count_not_passed
          params["page[cursor]"] = cursor if cursor
          query = params.empty? ? "" : "?#{Rack::Utils.build_query(params)}"

          "#{parsed_url.path}#{query}"
        end

        private
        def self.joined_or_null(list_or_string)
          list_or_string && list_or_string.empty? ? "null" : Array(list_or_string).join(',')
        end
      end
    end
  end
end
