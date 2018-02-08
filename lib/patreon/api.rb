module Patreon
  class API
    def initialize(access_token)
      @access_token = access_token
    end

    def fetch_user(opts = {})
      get_parse_json(Utils::JSONAPI::URLUtil.build_url('current_user', opts[:includes], opts[:fields]))
    end

    def fetch_campaign(opts = {})
      get_parse_json(Utils::JSONAPI::URLUtil.build_url('current_user/campaigns', opts[:includes], opts[:fields]))
    end

    def fetch_campaign_and_patrons(opts = {})
      opts[:includes] = opts[:includes] ? Array(opts[:includes]) : []
      opts[:includes].concat(Schemas::Campaign.default_relationships + [Schemas::Campaign::Relationships::PLEDGES])
      fetch_campaign(opts)
    end

    def fetch_page_of_pledges(campaign_id, opts = {})
      params = {}
      params["page[count]"] = opts[:count] || 10
      params["page[cursor]"] = opts[:cursor] if opts[:cursor]
      url = "campaigns/#{campaign_id}/pledges?#{Rack::Utils.build_query(params)}"
      get_parse_json(Patreon::Utils::JSONAPI::URLUtil.build_url(url, opts[:includes], opts[:fields]))
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

      req = Net::HTTP::Get.new("/api/oauth2/api/#{suffix}")
      req['Authorization'] = "Bearer #{@access_token}"
      req['User-Agent'] = Utils::Client.user_agent_string
      http.request(req).body
    end

    def parse_json(json)
      JSON::Api::Vanilla.parse(json)
    end
  end
end
