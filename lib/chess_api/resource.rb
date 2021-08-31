module ChessApi
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    private

    def get_request(endpoint, klass = Hash)
      handle_response(
        client.connection.get(endpoint),
        klass
      )
    end

    def handle_response(response, klass)
      raise ChessApi::Error, "An error happened while making your request" unless response.success?
      ChessApi.build_object(response.body, klass)
    end
  end
end