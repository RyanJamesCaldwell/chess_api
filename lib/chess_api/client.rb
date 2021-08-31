# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module ChessApi
  class Client
    BASE_URL = 'https://api.chess.com/pub/'

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def get_player(username:)
      PlayerResource.new(self).retrieve(username)
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.request :json
        conn.response :json, content_type: 'application/json'
        conn.adapter @adapter
      end
    end
  end
end