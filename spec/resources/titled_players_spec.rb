# frozen_string_literal: true

require "spec_helper"
require "faraday"

RSpec.describe ChessApi::TitledPlayerResource do
  let(:stub_request) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get(path) { |env| stub_response }
    end
  end
  let(:mock_client) { ChessApi::Client.new(adapter: :test, stubs: stub_request) }
  let(:username) { "test_username" }
  let(:stub_response) { [200, {"content-type" => "application/json"}, File.read(fixture_path)] }

  context "#with_title" do
    let(:path) { "pub/titled/WGM" }
    let(:fixture_path) { "spec/fixtures/titled_players/with_title/wgm.json" }

    it "returns a collection of titled players" do
      players_with_wgm_title = mock_client.titled_player.with_title(
        title_abbreviation: "wgm"
      )

      expect(players_with_wgm_title.class).to eq(ChessApi::Collection)
      expect(players_with_wgm_title.data.size).to eq(197)
      expect(players_with_wgm_title.data.first.class).to eq(ChessApi::TitledPlayer)
    end
  end
end
