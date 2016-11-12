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
      f.use      :gzip
      f.adapter  :net_http
    end
  end

  def artist mbid
    @http.get "/rest/#{@api_version}/artist/#{mbid}.json"
  end

  def city geo_id
    @http.get "/rest/#{@api_version}/city/#{geo_id}.json"
  end

  def setlist setlist_id
    @http.get "/rest/#{@api_version}/setlist/#{setlist_id}.json"
  end

  def user user_id
    @http.get "/rest/#{@api_version}/user/#{user_id}.json"
  end

  def venue venue_id
    @http.get "/rest/#{@api_version}/venue/#{venue_id}.json"
  end

  def artist_setlists mbid
    @http.get "/rest/#{@api_version}/artist/#{mbid}/setlists.json"
  end

  freeze
end
