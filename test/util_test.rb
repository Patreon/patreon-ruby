require "patreon"
require "minitest/autorun"

describe Patreon::Utils::JSONAPI::URLUtil do
  describe "build_url" do
    it "should build a url" do
      url = Patreon::Utils::JSONAPI::URLUtil.build_url("/")
      assert_equal url, "/"
    end

    it "should build a url with a string includes" do
      url = Patreon::Utils::JSONAPI::URLUtil.build_url("/", "include")
      assert_equal url, "/?include=include"
    end

    it "should build a url with an array includes" do
      url = Patreon::Utils::JSONAPI::URLUtil.build_url("/", ["some", "include"])
      assert_equal url, "/?include=some%2Cinclude"
    end

    it "should build a url with a fields" do
      url = Patreon::Utils::JSONAPI::URLUtil.build_url("/", nil, {hey: 123})
      assert_equal url, "/?fields%5Bhey%5D=123"
    end

    it "should build a url with a fields and includes" do
      url = Patreon::Utils::JSONAPI::URLUtil.build_url("/", ["some", "include"], {hey: 123})
      assert_equal url, "/?include=some%2Cinclude&fields%5Bhey%5D=123"
    end

    it "should merge with a pre-existing querystring" do
      url = Patreon::Utils::JSONAPI::URLUtil.build_url("/?1=2", ["some", "include"], {hey: 123})
      assert_equal url, "/?1=2&include=some%2Cinclude&fields%5Bhey%5D=123"
    end
  end
end
