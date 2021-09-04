# frozen_string_literal: true

require_relative 'chess_api/version'

module ChessApi
  autoload :Client, 'chess_api/client'
  autoload :Resource, 'chess_api/resource'
  autoload :Object, 'chess_api/object'
  autoload :Collection, 'chess_api/collection'
  autoload :Error, 'chess_api/error'

  # Objects
  autoload :Player, 'chess_api/objects/player'
  autoload :TitledPlayer, 'chess_api/objects/titled_player'
  autoload :Club, 'chess_api/objects/club'

  # Resources
  autoload :PlayerResource, 'chess_api/resources/players'
  autoload :TitledPlayerResource, 'chess_api/resources/titled_players'

  def self.build_object(data, klass)
    return data unless data.is_a?(Hash)
    klass.new(data)
  end
end
