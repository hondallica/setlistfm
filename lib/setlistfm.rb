require "faraday"
require "faraday_middleware"

class Setlistfm
  VERSION = "0.0.1"
  API_VERSION = "0.1"
  URL = "https://api.setlist.fm"

  attr_accessor :api_version, :url

  def initialize(url = URL)
    @api_version = API_VERSION
    @url = url
  end
  freeze
end
