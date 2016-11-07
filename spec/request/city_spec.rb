require "spec_helper"

describe Setlistfm do
  let(:setlistfm) { Setlistfm.new }
  let(:geo_id) { 5392171 }
  context "success" do
    let(:res) { setlistfm.city geo_id }
    it "is a Faraday::Response class" do
      expect(res.class).to eq Faraday::Response
    end
    it "is status code 200" do
      expect(res.status).to eq 200
    end
    context "body" do
      it "is a Hash class" do
        expect(res.body.class).to eq Hash
      end
      it "has city key" do
        expect(res.body).to include "city"
      end
    end
    context "headers" do
      it "is a Faraday::Utils::Headers class" do
        expect(res.headers.class).to eq Faraday::Utils::Headers
      end
      it "content-type is application/json" do
        expect(res.headers["content-type"]).to include "application/json"
      end
    end
    context "env" do
      it "is valid User-Agent" do
        expect(res.env.request_headers["User-Agent"]).to eq "Setlistfm/#{Setlistfm::VERSION}"
      end
      it "has a url" do
        expect(res.env.url.to_s).to eq "https://api.setlist.fm/rest/0.1/city/5392171.json"
      end
    end
  end
  context "fail" do
    let(:setlistfm) { Setlistfm.new }
    it "geo_id is nil" do
      expect{ setlistfm.city() }.to raise_error ArgumentError
    end
    it "when invalid gei_id" do
      expect{ setlistfm.city("aaa") }.to raise_error Faraday::ParsingError
    end
  end
end
