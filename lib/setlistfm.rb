require "faraday"
require "faraday_middleware"

class Setlistfm
  VERSION = "0.0.1"
  URL = "https://api.setlist.fm"

  attr_accessor :api_version, :url

  def initialize(url = URL)
    @api_version = "0.1"
    @url = url
  end
end
