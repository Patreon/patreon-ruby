require 'net/http'
require 'cgi'
require 'json'

module Patreon
  class API
    def initialize(access_token)
      @access_token = access_token
    end

    def fetch_user
      get_json('current_user')
    end

    def fetch_campaign_and_patrons()
      get_json('current_user/campaigns?include=rewards,creator,goals,pledges')
    end

    def fetch_campaign()
      get_json('current_user/campaigns?include=rewards,creator,goals')
    end

    def fetch_page_of_pledges(campaign_id, page_size, cursor=nil)
      url = "campaigns/#{campaign_id}/pledges?page%5Bcount%5D=#{CGI::escape(page_size.to_s)}"
      url += "&page%5Bcursor%5D=#{CGI::escape(cursor.to_s)}" if cursor
      get_json(url)
    end

    private

    def get_json(suffix)
      url = URI.parse("https://api.patreon.com/oauth2/api/#{suffix}")
      req = Net::HTTP::Get.new(url.to_s)
      req['Authorization'] = "Bearer #{@access_token}"
      res = Net::HTTP.start(url.host, url.port, :use_ssl => true) {|http| http.request(req)}
      JSON.parse(res.body)
    end
  end
end