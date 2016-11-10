require "spec_helper"

describe Setlistfm do
  it "has a version number" do
    expect(Setlistfm::VERSION).not_to be nil
  end
  let(:mbid) { "65f4f0c5-ef9e-490c-aee3-909e7ae6b2ab" }
  let(:res) { Setlistfm.new.artist mbid }
  it "is valid User-Agent" do
    expect(res.env.request_headers["User-Agent"]).to eq "Setlistfm/#{Setlistfm::VERSION}"
  end
  it "is a Faraday::Response class" do
    expect(res.class).to eq Faraday::Response
  end
  it "is a Faraday::Utils::Headers class" do
    expect(res.headers.class).to eq Faraday::Utils::Headers
  end
  it "content-type is application/json" do
    expect(res.headers["content-type"]).to include "application/json"
  end
end
