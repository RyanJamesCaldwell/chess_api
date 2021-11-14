# frozen_string_literal: true

require "spec_helper"
require "faraday"

RSpec.describe ChessApi::PlayerResource do
  let(:stub_request) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get(path) { |env| stub_response }
    end
  end
  let(:mock_client) { ChessApi::Client.new(adapter: :test, stubs: stub_request) }
  let(:username) { "test_username" }
  let(:stub_response) { [200, {"content-type" => "application/json"}, File.read(fixture_path)] }

  context "#retrieve" do
    let(:path) { "pub/player/#{username}" }
    let(:fixture_path) { "spec/fixtures/players/retrieve.json" }

    it "returns the user" do
      player = mock_client.player.retrieve(username: username)

      expect(player.class).to eq(ChessApi::Player)
      expect(player.username).to eq("test_username")
    end
  end

  context "#online_status" do
    let(:path) { "pub/player/#{username}/is-online" }
    let(:fixture_path) { "spec/fixtures/players/online_status.json" }

    it "returns the online status" do
      online_status = mock_client.player.online_status(username: username)

      expect(online_status).to eq("online")
    end
  end

  context "#clubs" do
    let(:path) { "pub/player/#{username}/clubs" }
    let(:fixture_path) { "spec/fixtures/players/clubs.json" }

    it "returns a collection of clubs" do
      player_clubs = mock_client.player.clubs(username: username)

      expect(player_clubs.class).to eq(ChessApi::Collection)
      expect(player_clubs.data.size).to eq(2)
      expect(player_clubs.data.first.class).to eq(ChessApi::Club)
    end
  end
end
