# frozen_string_literal: true

require_relative "chess_api/version"

module ChessApi
  autoload :Client, "chess_api/client"
  autoload :Collection, "chess_api/collection"
  autoload :Configuration, "chess_api/configuration"
  autoload :Error, "chess_api/error"
  autoload :InputHelpers, "chess_api/input_helpers"
  autoload :Object, "chess_api/object"
  autoload :Resource, "chess_api/resource"

  # Objects
  autoload :Club, "chess_api/objects/club"
  autoload :DailyPuzzle, "chess_api/objects/daily_puzzle"
  autoload :MonthlyGameArchive, "chess_api/objects/monthly_game_archive"
  autoload :Player, "chess_api/objects/player"
  autoload :Streamer, "chess_api/objects/streamer"
  autoload :TitledPlayer, "chess_api/objects/titled_player"

  # Resources
  autoload :DailyPuzzleResource, "chess_api/resources/daily_puzzles"
  autoload :MonthlyGameArchiveResource, "chess_api/resources/monthly_game_archives"
  autoload :PlayerResource, "chess_api/resources/players"
  autoload :StreamerResource, "chess_api/resources/streamers"
  autoload :TitledPlayerResource, "chess_api/resources/titled_players"

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
