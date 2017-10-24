require 'net/http'
require 'cgi'
require 'json'
require 'json-api-vanilla'

module Patreon
  class API
    def initialize(access_token)
      @access_token = access_token
    end

    def fetch_user(includes=nil, fields=nil, parse=True)
      get_parsed_or_unparsed(
          Utils::JSONAPI::URLUtil.build_url('current_user',includes,fields),
          parse
      )
    end

    def fetch_campaign(includes=nil, fields=nil, parse=True)
      get_parsed_or_unparsed(
          Utils::JSONAPI::URLUtil.build_url('current_user/campaigns',includes,fields),
          parse
      )
    end

    def fetch_campaign_and_patrons(includes=nil, fields=nil, parse=True)
      includes ||= Schemas::Campaign.default_relationships + [Schemas::Campaign::Relationships::PLEDGES]
      fetch_campaign(includes, fields, parse=parse)
    end

    def fetch_page_of_pledges(campaign_id, page_size, cursor=nil, includes=nil, fields=nil, parse=True)
      url = "campaigns/#{campaign_id}/pledges"
      url += "?page%5Bcount%5D=#{CGI::escape(page_size.to_s)}"
      url += "&page%5Bcursor%5D=#{CGI::escape(cursor.to_s)}" if cursor
      get_parsed_or_unparsed(
          Patreon::Utils::JSONAPI::URLUtil.build_url(url,includes,fields),
          parse
      )
    end

    private

    def get_parsed_or_unparsed(suffix, parse)
      if parse
          return get_jsonapi_doc(suffix)
      return get_json(suffix)
    end

    def get_jsonapi_doc(suffix)
      response = get_data(suffix)
      return JSON::Api::Vanilla.parse(response.body)
    end

    def get_json(suffix)
      response = get_data(suffix)
      return JSON.parse(res.body)
    end

    def get_data(suffix)
      url = URI.parse("https://api.patreon.com/oauth2/api/#{suffix}")
      req = Net::HTTP::Get.new(url.to_s)
      req['Authorization'] = "Bearer #{@access_token}"
      response = Net::HTTP.start(url.host, url.port, :use_ssl => true) {|http| http.request(req)}
      return response
    end
  end
end
