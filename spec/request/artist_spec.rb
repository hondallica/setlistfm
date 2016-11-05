require "spec_helper"
require "pp"

describe Setlistfm do
  let(:setlistfm) { Setlistfm.new }
  let(:mbid) { "65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab" }
  context "success" do
    let(:res) { setlistfm.artist mbid }
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
      it "has artist key" do
        expect(res.body).to include "artist"
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
        expect(res.env.url.to_s).to eq "https://api.setlist.fm/rest/0.1/artist/65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab.json"
      end
    end
  end
  context "fail" do
    let(:setlistfm) { Setlistfm.new }
    it "mbid is nil" do
      expect{ setlistfm.artist() }.to raise_error ArgumentError
    end
    it "when invalid mbid" do
      expect{ setlistfm.artist("aaa") }.to raise_error Faraday::ParsingError
    end
    it "mbid is not found" do
      expect{ setlistfm.artist("aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa") }.to raise_error Faraday::ParsingError
    end
  end
end
