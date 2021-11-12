module ChessApi
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(endpoint)
      handle_response(client.connection.get(endpoint))
    end

    def handle_response(response)
      raise ChessApi::Error, "An error happened while making your request" unless response.success?

      response
    end
  end
end
