require "patreon"
require "mocha/mini_test"
require "minitest/autorun"

describe Patreon::API do
  before do
    @api = Patreon::API.new("some token")
  end

  describe "Patreon::API#fetch_user" do
    CURRENT_USER_RESPONSE = File.read(File.expand_path("fixtures/current_user.json", __dir__))

    it "should get current_user" do
      @api.expects(:get_json).with("current_user").returns(CURRENT_USER_RESPONSE)
      response = @api.fetch_user
      assert_equal response.data.pledges.count, 5
      assert_equal response.data.vanity, "corgi"
    end

    it "should get current_user with includes" do
      @api.expects(:get_json).with("current_user?include=hello").returns(CURRENT_USER_RESPONSE)
      response = @api.fetch_user(includes: "hello")
    end

    it "should get current_user with fields" do
      @api.expects(:get_json).with("current_user?fields%5Bhello%5D=there").returns(CURRENT_USER_RESPONSE)
      response = @api.fetch_user(fields: {hello: "there"})
    end
  end

  describe "Patreon::API#fetch_campaign" do
    FETCH_CAMPAIGN_RESPONSE = File.read(File.expand_path("fixtures/fetch_campaign.json", __dir__))

    it "should get fetch_campaign" do
      @api.expects(:get_json).with("current_user/campaigns").returns(FETCH_CAMPAIGN_RESPONSE)
      response = @api.fetch_campaign
      assert_equal response.data.count, 1
      assert_equal response.data[0].creation_name, "an unforgettable high school experience"
    end

    it "should get fetch_campaign with includes" do
      @api.expects(:get_json).with("current_user/campaigns?include=hello").returns(FETCH_CAMPAIGN_RESPONSE)
      response = @api.fetch_campaign(includes: "hello")
    end

    it "should get fetch_campaign with fields" do
      @api.expects(:get_json).with("current_user/campaigns?fields%5Bhello%5D=there").returns(FETCH_CAMPAIGN_RESPONSE)
      response = @api.fetch_campaign(fields: {hello: "there"})
    end
  end

  describe "Patreon::API#fetch_campaign_and_patrons" do
    FETCH_CAMPAIGN_RESPONSE = File.read(File.expand_path("fixtures/fetch_campaign.json", __dir__))

    it "should get fetch_campaign_and_patrons" do
      @api.expects(:get_json).with("current_user/campaigns?include=rewards%2Ccreator%2Cgoals%2Cpledges").returns(FETCH_CAMPAIGN_RESPONSE)
      response = @api.fetch_campaign_and_patrons
    end

    it "should get fetch_campaign_and_patrons with more includes" do
      @api.expects(:get_json).with("current_user/campaigns?include=doohickey%2Crewards%2Ccreator%2Cgoals%2Cpledges").returns(FETCH_CAMPAIGN_RESPONSE)
      response = @api.fetch_campaign_and_patrons(includes: "doohickey")
    end
  end

  describe "Patreon::API#fetch_page_of_pledges" do
    it "should get fetch_page_of_pledges" do
      @api.expects(:get_json).with("campaigns/123/pledges?page%5Bcount%5D=10").returns(FETCH_CAMPAIGN_RESPONSE)
      @api.fetch_page_of_pledges(123)
    end
  end
end
