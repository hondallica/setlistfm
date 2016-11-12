require "spec_helper"

describe "Setlistfm.setlist_lastfm" do
  let(:setlistfm) { Setlistfm.new }
  let(:lastfm_event_id) { "999009" }
  context "success" do
    let(:res) { setlistfm.setlist_lastfm lastfm_event_id }
    it "has a request url" do
      expect(res.env.url.to_s).to eq "https://api.setlist.fm/rest/0.1/setlist/lastFm/999009.json"
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
    it "setlist_lastfm_id is nil" do
      expect{ setlistfm.setlist_lastfm() }.to raise_error ArgumentError
    end
    it "when invalid lastfm_event_id" do
      expect{ setlistfm.setlist_lastfm("000000") }.to raise_error Faraday::ParsingError
    end
  end
end
