require "spec_helper"

describe Setlistfm do
  let(:setlistfm) { Setlistfm.new }
  let(:setlist_id) { "3bd6440c" }
  context "success" do
    let(:res) { setlistfm.setlist setlist_id }
    it "has a request url" do
      expect(res.env.url.to_s).to eq "https://api.setlist.fm/rest/0.1/setlist/3bd6440c.json"
    end
    it "is status code 200" do
      expect(res.status).to eq 200
    end
    context "body" do
      it "is a Hash class" do
        expect(res.body.class).to eq Hash
      end
      it "has city key" do
        expect(res.body).to include "setlist"
      end
    end
  end
  context "fail" do
    let(:setlistfm) { Setlistfm.new }
    it "setlist_id is nil" do
      expect{ setlistfm.setlist() }.to raise_error ArgumentError
    end
    it "when invalid setlist_id" do
      expect{ setlistfm.setlist("aaa") }.to raise_error Faraday::ParsingError
    end
  end
end
