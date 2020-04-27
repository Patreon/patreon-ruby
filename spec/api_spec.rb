# This file is auto-generated from the same code that generates
# https://docs.patreon.com. Community pull requests against this
# file may not be accepted.

require 'json'

describe Patreon::API do
  before do
    @api = Patreon::API.new("some token")
  end

  describe "Patreon::API" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/current_user.json", __dir__))
    end

    it "should parse data" do
      @api.expects(:get_json).with("identity").returns(@response)
      response = @api.get_identity
      assert_equal response.data.pledges.count, 5
      assert_equal response.data.vanity, "corgi"
      assert_equal response.data.first_name, "Corgi"
    end

    it "should allow mutating data" do
      @api.expects(:get_json).with("identity").returns(@response)
      response = @api.get_identity
      assert_equal response.data.first_name, "Corgi"
      response.data.first_name = "Jack"
      assert_equal response.data.first_name, "Jack"
    end

    it "should support nill value" do
      munged_response = JSON.parse(@response)
      munged_response['data']['attributes']['first_name'] = nil
      @api.expects(:get_json).with("identity").returns(munged_response.to_json)
      response = @api.get_identity
      assert_nil response.data.first_name
    end
  end

  describe "Patreon::API#get_campaigns" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/current_user.json", __dir__))
    end

    it "should return data" do
      resource_id = "32187"
      expected_url = "campaigns"
      expected_url += "?page%5Bcount%5D=10"
      @api.expects(:get_json).with(expected_url).returns(@response)
      response = @api.get_campaigns()
      assert_equal response.data.id, resource_id
    end
  end

  describe "Patreon::API#get_identity" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/current_user.json", __dir__))
    end

    it "should return data" do
      resource_id = "32187"
      expected_url = "identity"
      @api.expects(:get_json).with(expected_url).returns(@response)
      response = @api.get_identity()
      assert_equal response.data.id, resource_id
    end
  end

  describe "Patreon::API#get_webhooks" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/current_user.json", __dir__))
    end

    it "should return data" do
      resource_id = "32187"
      expected_url = "webhooks"
      expected_url += "?page%5Bcount%5D=10"
      @api.expects(:get_json).with(expected_url).returns(@response)
      response = @api.get_webhooks()
      assert_equal response.data.id, resource_id
    end
  end

  describe "Patreon::API#get_campaigns_by_id_members" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/current_user.json", __dir__))
    end

    it "should return data" do
      resource_id = "32187"
      expected_url = "campaigns/{}/members".gsub('{}', resource_id)
      expected_url += "?page%5Bcount%5D=10"
      @api.expects(:get_json).with(expected_url).returns(@response)
      response = @api.get_campaigns_by_id_members(resource_id)
      assert_equal response.data.id, resource_id
    end
  end

  describe "Patreon::API#get_campaigns_by_id" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/current_user.json", __dir__))
    end

    it "should return data" do
      resource_id = "32187"
      expected_url = "campaigns/{}".gsub('{}', resource_id)
      @api.expects(:get_json).with(expected_url).returns(@response)
      response = @api.get_campaigns_by_id(resource_id)
      assert_equal response.data.id, resource_id
    end
  end

  describe "Patreon::API#get_webhooks_by_id" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/current_user.json", __dir__))
    end

    it "should return data" do
      resource_id = "32187"
      expected_url = "webhooks/{}".gsub('{}', resource_id)
      @api.expects(:get_json).with(expected_url).returns(@response)
      response = @api.get_webhooks_by_id(resource_id)
      assert_equal response.data.id, resource_id
    end
  end

  describe "Patreon::API#get_members_by_id" do
    before(:all) do
      @response = File.read(File.expand_path("fixtures/current_user.json", __dir__))
    end

    it "should return data" do
      resource_id = "32187"
      expected_url = "members/{}".gsub('{}', resource_id)
      @api.expects(:get_json).with(expected_url).returns(@response)
      response = @api.get_members_by_id(resource_id)
      assert_equal response.data.id, resource_id
    end
  end

end