# frozen_string_literal: true

module ChessApi
  class Configuration
    attr_accessor :user_agent

    def initialize
      @user_agent = nil
    end
  end
end
