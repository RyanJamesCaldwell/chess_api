module ChessApi
  class TitledPlayerResource < Resource
    include InputHelpers

    def with_title(title_abbreviation:)
      @title_abbreviation = title_abbreviation

      Collection.from_response(
        get_request("titled/#{upcased_title_abbreviation}"),
        key: "players",
        type: ChessApi::TitledPlayer
      )
    end
  end
end