module ChessApi
  class PlayerResource < Resource

    module OnlineStatus
      ONLINE = "online",
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

    private

    def downcased_username
      @username&.downcase
    end
  end
end