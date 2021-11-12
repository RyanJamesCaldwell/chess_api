module ChessApi
  class Player < Object
    def self.from_response(response)
      new(response.body)
    end
  end
end
