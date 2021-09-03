module ChessApi
  class Collection
    attr_reader :data

    def self.from_response(response, key:, type:)
      body = response.body
      new(
        data: body[key].map { |attrs| type.new(attrs) }
      )
    end

    def initialize(data:)
      @data = data
    end
  end
end