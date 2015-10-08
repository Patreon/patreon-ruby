module Patreon
  class OAuth
    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
    end

    def get_tokens(code, redirect_uri)
      update_token({
          "grant_type" => "authorization_code",
          "code" => code,
          "client_id" => @client_id,
          "client_secret" => @client_secret,
          "redirect_uri" => redirect_uri
      })
    end

    def refresh_token(refresh_token, redirect_uri)
      update_token({
          "grant_type": "refresh_token",
          "refresh_token": refresh_token,
          "client_id" => @client_id,
          "client_secret" => @client_secret
      })
    end

    def fetch_user(access_token)
      get_json('current_user', access_token)
    end

    def fetch_campaign_and_patrons(access_token)
      get_json('current_user/campaign', access_token)
    end

    private

    def update_token(params)
      url = URI.parse('https://api.patreon.com/oauth2/token')
      url.query = URI.encode_www_form(params)
      req = Net::HTTP::Post.new(url.to_s)
      res = Net::HTTP.start(url.host, url.port, :use_ssl => true) {|http| http.request(req)}
      JSON.parse(res.body)
    end

    def get_json(suffix, access_token)
      url = URI.parse("https://api.patreon.com/oauth2/api/#{suffix}")
      req = Net::HTTP::Get.new(url.to_s)
      req['Authorization'] = "Bearer #{access_token}"
      res = Net::HTTP.start(url.host, url.port, :use_ssl => true) {|http| http.request(req)}
      JSON.parse(res.body)
    end
  end
end