require "spec_helper"

describe "Setlistfm.setlist_version" do
  let(:setlistfm) { Setlistfm.new }
  let(:version_id) { "6bd45a36" }
  context "success" do
    let(:res) { setlistfm.setlist_version version_id }
    it "has a request url" do
      expect(res.env.url.to_s).to eq "https://api.setlist.fm/rest/0.1/setlist/version/6bd45a36.json"
    end
    it "is status code 200" do
      expect(res.status).to eq 200
    end
    context "body" do
      it "is a Hash class" do
        expect(res.body.class).to eq Hash
      end
      it "has setlist key" do
        expect(res.body).to include "setlist"
      end
    end
  end
  context "fail" do
    let(:setlistfm) { Setlistfm.new }
    it "version_id is nil" do
      expect{ setlistfm.setlist_version() }.to raise_error ArgumentError
    end
    it "when invalid version_id" do
      expect{ setlistfm.setlist_version("aaa") }.to raise_error Faraday::ParsingError
    end
  end
end
