module ChessApi
  class PlayerResource < Resource
    def retrieve(username)
      username = username&.downcase
      get_request("player/#{username}", ChessApi::Player)
    end
  end
end