module ChessApi
  class TitledPlayerResource < Resource
    def with_title(title_abbreviation:)
      Collection.from_response(
        get_request("titled/#{title_abbreviation&.upcase}"),
        key: "players",
        type: ChessApi::TitledPlayer
      )
    end
  end
end