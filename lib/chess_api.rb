# frozen_string_literal: true

require_relative 'chess_api/version'

module ChessApi
  autoload :Client, 'chess_api/client'
  autoload :Error, 'chess_api/error'
  autoload :Object, 'chess_api/object'
  autoload :Player, 'chess_api/objects/player'
end
