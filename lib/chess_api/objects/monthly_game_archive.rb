module ChessApi
  class MonthlyGameArchive < Object
    def initialize(archive_url)
      super({url: archive_url})
    end
  end
end