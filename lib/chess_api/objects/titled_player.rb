module ChessApi
  class TitledPlayer < Object
    def initialize(name)
      super({username: name})
    end
  end
end
