require 'net/http'
require 'json'

module Patreon
  class API
    def initialize(access_token)
      @access_token = access_token
    end

    def fetch_user
      get_json('current_user')
    end

    def fetch_campaign_and_patrons(access_token)
      get_json('current_user/campaigns?include=rewards,creator,goals,pledges')
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