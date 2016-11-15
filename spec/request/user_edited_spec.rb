require "spec_helper"

describe "Setlistfm.user_edited" do
  let(:setlistfm) { Setlistfm.new }
  let(:user_id) { "fuzy" }
  context "success" do
    let(:res) { setlistfm.user_edited user_id }
    it "has a request url" do
      expect(res.env.url.to_s).to eq "https://api.setlist.fm/rest/0.1/user/fuzy/edited.json"
    end
    it "is status code 200" do
      expect(res.status).to eq 200
    end
    context "body" do
      it "is a Hash class" do
        expect(res.body.class).to eq Hash
      end
      it "has setlists key" do
        expect(res.body).to include "setlists"
      end
    end
  end
  context "fail" do
    let(:setlistfm) { Setlistfm.new }
    it "user_id is nil" do
      expect{ setlistfm.user_edited() }.to raise_error ArgumentError
    end
    it "when invalid user_id" do
      expect{ setlistfm.user_edited("-") }.to raise_error Faraday::ParsingError
    end
  end
end
