module ChessApi
  module InputHelpers
    def downcased_username
      @username&.downcase
    end

    def upcased_title_abbreviation
      @title_abbreviation&.upcase
    end
  end
end