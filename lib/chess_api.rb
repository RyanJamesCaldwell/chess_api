# frozen_string_literal: true

require_relative 'chess_api/version'

module ChessApi
  autoload :Client, 'chess_api/client'
  autoload :Resource, 'chess_api/resource'
  autoload :Object, 'chess_api/object'
  autoload :Error, 'chess_api/error'

  # Objects
  autoload :Player, 'chess_api/objects/player'

  # Resources
  autoload :PlayerResource, 'chess_api/resources/players'

  def self.build_object(data, klass)
    return data unless data.is_a?(Hash)
    klass.new(data)
  end
end
