# frozen_string_literal: true

require "spec_helper"
require "faraday"

RSpec.describe ChessApi::DailyPuzzleResource do
  let(:stub_request) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get(path) { |env| stub_response }
    end
  end
  let(:mock_client) { ChessApi::Client.new(adapter: :test, stubs: stub_request) }
  let(:username) { "test_username" }
  let(:stub_response) { [200, {"content-type" => "application/json"}, File.read(fixture_path)] }

  context "#retrieve" do
    let(:path) { "pub/puzzle" }
    let(:fixture_path) { "spec/fixtures/daily_puzzles/retrieve.json" }

    it "returns a daily puzzle" do
      daily_puzzle = mock_client.daily_puzzle.retrieve

      expect(daily_puzzle.class).to eq(ChessApi::DailyPuzzle)
    end
  end

  context "random" do
    let(:path) { "pub/puzzle/random" }
    let(:fixture_path) { "spec/fixtures/daily_puzzles/random.json" }

    it "returns a daily puzzle" do
      daily_puzzle = mock_client.daily_puzzle.random

      expect(daily_puzzle.class).to eq(ChessApi::DailyPuzzle)
    end
  end
end
