require 'faraday'
require 'faraday_middleware'

module TmdbWrapper
  class Client
    BASE_URL = 'https://api.themoviedb.org/3/'

    attr_reader :api_key, :adapter

    def initialize(api_key:, adapter: Faraday.default_adapter)
      @api_key = api_key
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.request :json
        conn.response :json, content_type: 'application/json'
        conn.adapter adapter
      end
    end

    def inspect
      "#<Tmdb::Client>"
    end
  end
end
