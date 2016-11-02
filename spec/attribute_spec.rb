require "spec_helper"

describe "attribute" do
  let(:setlistfm) { Setlistfm.new }
  context "api_version" do
    it "has an api_version" do
      expect(setlistfm::api_version).to eq "0.1"
    end
    it "can change after initialize" do
      setlistfm.api_version = "666"
      expect(setlistfm::api_version).to eq "666"
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
  end
end
