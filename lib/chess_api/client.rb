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
      res = connection.get("player/#{username}")

      if res.success?
        ChessApi::Player.from_response(res)
      else
        ChessApi::Error.new("Error requesting #{} from Chess.com")
      end
    end

    private

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