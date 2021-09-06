# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'

module ChessApi
  class Client
    BASE_URL = 'https://api.chess.com/pub/'

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def player
      PlayerResource.new(self)
    end

    def titled_player
      TitledPlayerResource.new(self)
    end

    def monthly_game_archive
      MonthlyGameArchiveResource.new(self)
    end

    def daily_puzzle
      DailyPuzzleResource.new(self)
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