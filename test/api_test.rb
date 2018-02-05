require "patreon"
require "mocha/mini_test"
require "minitest/autorun"

describe Patreon::API do
  before do
    @api = Patreon::API.new("some token")
  end

  describe "Patreon::API#fetch_user" do
    it "should get current_user" do
      @api.expects(:get_json).with("current_user?").returns(File.read(File.expand_path("fixtures/current_user.json", __dir__)))
      response = @api.fetch_user
      assert_equal response.data.pledges.count, 5
      assert_equal response.data.vanity, "corgi"
    end
  end
end
