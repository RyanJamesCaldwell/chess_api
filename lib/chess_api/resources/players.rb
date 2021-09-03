module ChessApi
  class PlayerResource < Resource
    def retrieve(username:)
      response = get_request("player/#{username&.downcase}")

      ChessApi::Player.new(response.body)
    end
  end
end