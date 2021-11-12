module ChessApi
  class PlayerResource < Resource
    include InputHelpers

    module OnlineStatus
      ONLINE = "online"
      OFFLINE = "offline"
    end

    def retrieve(username:)
      @username = username

      ChessApi::Player.new(
        get_request("player/#{downcased_username}").body
      )
    end

    def online_status(username:)
      @username = username
      is_online = get_request("player/#{downcased_username}/is-online").body["online"]

      is_online ? OnlineStatus::ONLINE : OnlineStatus::OFFLINE
    end

    def clubs(username:)
      @username = username

      ChessApi::Collection.from_response(
        get_request("player/#{downcased_username}/clubs"),
        key: "clubs",
        type: ChessApi::Club
      )
    end
  end
end
