module ChessApi
  class DailyPuzzleResource < Resource
    def retrieve
      ChessApi::DailyPuzzle.new(
        get_request("puzzle").body
      )
    end

    def random
      ChessApi::DailyPuzzle.new(
        get_request("puzzle/random").body
      )
    end
  end
end
