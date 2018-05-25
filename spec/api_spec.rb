describe Patreon::API do
  before do
    @api = Patreon::API.new("some token")
  end

  describe "Patreon::API#fetch_user" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/current_user.json", __dir__))
    end

    it "should get current_user" do
      @api.expects(:get_json).with("current_user").returns(@response)
      response = @api.fetch_user
      assert_equal response.data.pledges.count, 5
      assert_equal response.data.vanity, "corgi"
    end

    it "should get current_user with includes" do
      @api.expects(:get_json).with("current_user?include=hello").returns(@response)
      @api.fetch_user(includes: "hello")
    end

    it "should get current_user with fields" do
      @api.expects(:get_json).with("current_user?fields%5Bhello%5D=there").returns(@response)
      @api.fetch_user(fields: {hello: "there"})
    end
  end

  describe "Patreon::API#fetch_campaign" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/fetch_campaign.json", __dir__))
    end

    it "should get fetch_campaign" do
      @api.expects(:get_json).with("current_user/campaigns").returns(@response)
      response = @api.fetch_campaign
      assert_equal response.data.count, 1
      assert_equal response.data[0].creation_name, "an unforgettable high school experience"
    end

    it "should get fetch_campaign with includes" do
      @api.expects(:get_json).with("current_user/campaigns?include=hello").returns(@response)
      @api.fetch_campaign(includes: "hello")
    end

    it "should get fetch_campaign with fields" do
      @api.expects(:get_json).with("current_user/campaigns?fields%5Bhello%5D=there").returns(@response)
      @api.fetch_campaign(fields: {hello: "there"})
    end
  end

  describe "Patreon::API#fetch_campaign_and_patrons" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/fetch_campaign.json", __dir__))
    end

    it "should get fetch_campaign_and_patrons" do
      @api.expects(:get_json).with("current_user/campaigns?include=rewards%2Ccreator%2Cgoals%2Cpledges").returns(@response)
      @api.fetch_campaign_and_patrons
    end

    it "should get fetch_campaign_and_patrons with more includes" do
      @api.expects(:get_json).with("current_user/campaigns?include=doohickey%2Crewards%2Ccreator%2Cgoals%2Cpledges").returns(@response)
      @api.fetch_campaign_and_patrons(includes: "doohickey")
    end
  end

  describe "Patreon::API#fetch_page_of_pledges" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/fetch_campaign.json", __dir__))
    end

    it "should get fetch_page_of_pledges" do
      @api.expects(:get_json).with("campaigns/123/pledges?page%5Bcount%5D=10").returns(@response)
      @api.fetch_page_of_pledges(123)
    end
  end
end
