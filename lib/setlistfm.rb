require "faraday"
require "faraday_middleware"

class Setlistfm
  include Faraday

  VERSION = "0.0.1"
  API_VERSION = "0.1"
  URL = "https://api.setlist.fm"

  attr_accessor :api_version, :url

  def initialize(url = URL)
    @api_version = API_VERSION
    @url = url
    @http = Faraday.new(@url) do |f|
      f.headers[:user_agent] = "Setlistfm/#{Setlistfm::VERSION}"
      f.request  :url_encoded
      f.response :json
      f.adapter  :net_http
    end
  end

  def artist mbid
    @http.get "/rest/#{@api_version}/artist/#{mbid}.json"
  end

  freeze
end
