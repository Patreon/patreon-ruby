# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

module Patreon
  class API
    include Patreon::Utils::JSONAPI
    
    def initialize(access_token)
      @access_token = access_token
    end
    
    def get_campaigns(opts = {})
        base_url = "campaigns"
        url = URLUtil.build_url(base_url, opts[:includes], opts[:fields], opts[:count], opts[:cursor])
        get_parse_json(url)
    end

    def get_identity(opts = {})
        base_url = "identity"
        url = URLUtil.build_url(base_url, opts[:includes], opts[:fields])
        get_parse_json(url)
    end

    def get_webhooks(opts = {})
        base_url = "webhooks"
        url = URLUtil.build_url(base_url, opts[:includes], opts[:fields], opts[:count], opts[:cursor])
        get_parse_json(url)
    end

    def get_campaigns_by_id_members(resource_id, opts = {})
        base_url = "campaigns/{}/members".gsub('{}', resource_id)
        url = URLUtil.build_url(base_url, opts[:includes], opts[:fields], opts[:count], opts[:cursor])
        get_parse_json(url)
    end

    def get_campaigns_by_id(resource_id, opts = {})
        base_url = "campaigns/{}".gsub('{}', resource_id)
        url = URLUtil.build_url(base_url, opts[:includes], opts[:fields])
        get_parse_json(url)
    end

    def get_webhooks_by_id(resource_id, opts = {})
        base_url = "webhooks/{}".gsub('{}', resource_id)
        url = URLUtil.build_url(base_url, opts[:includes], opts[:fields])
        get_parse_json(url)
    end

    def get_members_by_id(resource_id, opts = {})
        base_url = "members/{}".gsub('{}', resource_id)
        url = URLUtil.build_url(base_url, opts[:includes], opts[:fields])
        get_parse_json(url)
    end

    private

    def get_parse_json(suffix)
      json = get_json(suffix)
      parse_json(json)
    end

    def get_json(suffix)
      http = Net::HTTP.new("www.patreon.com", 443)
      http.use_ssl = true

      # TODO: It would be nice if we verified our certs
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      #SECURITY HOLE
      http.set_debug_output($stdout) if ENV['DEBUG']

      req = Net::HTTP::Get.new("/api/oauth2/v2/#{suffix}")
      req['Authorization'] = "Bearer #{@access_token}"
      req['User-Agent'] = Utils::Client.user_agent_string
      http.request(req).body
    end

    def parse_json(json)
      JSON::Api::Vanilla.parse(json)
    end
  end
end