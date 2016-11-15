require "spec_helper"

describe "Setlistfm.user" do
  let(:setlistfm) { Setlistfm.new }
  let(:user_id) { "hondallica" }
  context "success" do
    let(:res) { setlistfm.user user_id }
    it "has a request url" do
      expect(res.env.url.to_s).to eq "https://api.setlist.fm/rest/0.1/user/hondallica.json"
    end
    it "is status code 200" do
      expect(res.status).to eq 200
    end
    context "body" do
      it "is a Hash class" do
        expect(res.body.class).to eq Hash
      end
      it "has user key" do
        expect(res.body).to include "user"
      end
    end
  end
  context "fail" do
    let(:setlistfm) { Setlistfm.new }
    it "user_id is nil" do
      expect{ setlistfm.user() }.to raise_error ArgumentError
    end
    it "when invalid user_id" do
      expect{ setlistfm.user("-") }.to raise_error Faraday::ParsingError
    end
  end
end
