module ChessApi
  class StreamerResource < Resource
    def list
      Collection.from_response(
        get_request("streamers"),
        key: "streamers",
        type: ChessApi::Streamer
      )
    end
  end
end