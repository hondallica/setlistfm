require "spec_helper"

describe "attribute" do
  let(:setlistfm) { Setlistfm.new }
  context "VERSION" do
    it "has constant VERSION" do
      expect(Setlistfm::VERSION).to eq "0.0.1"
    end
    it "can't modify constant VERSION" do
      expect{Setlistfm::VERSION = "666"}.to raise_error RuntimeError
      expect(Setlistfm::VERSION).not_to eq "666"
    end
  end
  context "api_version" do
    it "has an api_version" do
      expect(setlistfm::api_version).to eq "0.1"
    end
    it "can change after initialize" do
      setlistfm.api_version = "666"
      expect(setlistfm::api_version).to eq "666"
    end
    it "has constant API_VERSION" do
      expect(Setlistfm::API_VERSION).to eq "0.1"
    end
    it "can't modify constant API_VERSION" do
      expect{Setlistfm::API_VERSION = "666"}.to raise_error RuntimeError
      expect(Setlistfm::API_VERSION).not_to eq "666"
    end
  end
  context "url" do
    it "has a url" do
      expect(setlistfm::url).to eq "https://api.setlist.fm"
    end
    it "can change at initialize" do
      expect(Setlistfm.new("http://example.com").url).to eq "http://example.com"
    end
    it "can change after initialize" do
      s = Setlistfm.new
      s.url = "http://example.com"
      expect(s.url).to eq "http://example.com"
    end
    it "has constant URL" do
      expect(Setlistfm::URL).to eq "https://api.setlist.fm"
    end
    it "can't modify constant URL" do
      expect{Setlistfm::URL = "http://example.com"}.to raise_error RuntimeError
      expect(Setlistfm::URL).not_to eq "http://example.com"
    end
  end
end
