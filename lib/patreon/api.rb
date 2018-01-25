require 'net/http'
require 'cgi'
require 'json'
require 'json-api-vanilla'
require 'openssl'

module Patreon
  class API
    def initialize(access_token)
      @access_token = access_token
    end

    def fetch_user(includes=nil, fields=nil)
      get_json(Utils::JSONAPI::URLUtil.build_url('current_user',includes,fields))
    end

    def fetch_campaign(includes=nil, fields=nil)
      get_json(Utils::JSONAPI::URLUtil.build_url('current_user/campaigns',includes,fields))
    end

    def fetch_campaign_and_patrons(includes=nil, fields=nil)
      includes ||= Schemas::Campaign.default_relationships + [Schemas::Campaign::Relationships::PLEDGES]
      fetch_campaign(includes, fields)
    end

    def fetch_page_of_pledges(campaign_id, page_size, cursor=nil, includes=nil, fields=nil)
      url = "campaigns/#{campaign_id}/pledges"
      url += "?page%5Bcount%5D=#{CGI::escape(page_size.to_s)}"
      url += "&page%5Bcursor%5D=#{CGI::escape(cursor.to_s)}" if cursor
      get_json(Patreon::Utils::JSONAPI::URLUtil.build_url(url,includes,fields))
    end

    private

    def get_json(suffix)
      http = Net::HTTP.new("www.patreon.com", 443)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      #SECURITY HOLE
      http.set_debug_output($stdout) if ENV['DEBUG']

      url = URI.parse("https://www.patreon.com/api/oauth2/api/#{suffix}")
      req = Net::HTTP::Get.new(url.to_s)
      req['Authorization'] = "Bearer #{@access_token}"
      req['User-Agent'] = Utils::Client.user_agent_string
      res = http.request(req)
      return JSON::Api::Vanilla.parse(res.body)
    end
  end
end
