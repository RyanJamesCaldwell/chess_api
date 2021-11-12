module ChessApi
  class MonthlyGameArchiveResource < Resource
    include InputHelpers

    def list(username:)
      @username = username
      result = get_request("player/#{downcased_username}/games/archives")

      Collection.from_response(
        result,
        key: "archives",
        type: ChessApi::MonthlyGameArchive
      )
    end
  end
end
