require "spec_helper"

describe "Setlistfm.venue" do
  let(:setlistfm) { Setlistfm.new }
  let(:venue_id) { "3bd654f4" }
  context "success" do
    let(:res) { setlistfm.venue venue_id }
    it "has a request url" do
      expect(res.env.url.to_s).to eq "https://api.setlist.fm/rest/0.1/venue/3bd654f4.json"
    end
    it "is status code 200" do
      expect(res.status).to eq 200
    end
    context "body" do
      it "is a Hash class" do
        expect(res.body.class).to eq Hash
      end
      it "has venue key" do
        expect(res.body).to include "venue"
      end
    end
  end
  context "fail" do
    let(:setlistfm) { Setlistfm.new }
    it "venue_id is nil" do
      expect{ setlistfm.venue() }.to raise_error ArgumentError
    end
    it "when invalid venue_id" do
      expect{ setlistfm.venue("-") }.to raise_error Faraday::ParsingError
    end
  end
end
