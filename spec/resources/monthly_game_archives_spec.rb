# frozen_string_literal: true

require "spec_helper"
require "faraday"

RSpec.describe ChessApi::MonthlyGameArchiveResource do
  let(:stub_request) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get(path) { |env| stub_response }
    end
  end
  let(:mock_client) { ChessApi::Client.new(adapter: :test, stubs: stub_request) }
  let(:username) { "test_username" }
  let(:stub_response) { [200, {"content-type" => "application/json"}, File.read(fixture_path)] }

  context "#list" do
    let(:path) { "pub/player/#{username}/games/archives" }
    let(:fixture_path) { "spec/fixtures/monthly_game_archives/list.json" }

    it "returns a collection of monthly game archives" do
      monthly_game_archives = mock_client.monthly_game_archive.list(username: username)

      expect(monthly_game_archives.class).to eq(ChessApi::Collection)
      expect(monthly_game_archives.data.size).to eq(13)
      expect(monthly_game_archives.data.first.class).to eq(ChessApi::MonthlyGameArchive)
    end
  end
end
