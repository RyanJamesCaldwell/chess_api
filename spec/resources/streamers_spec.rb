# frozen_string_literal: true

require "spec_helper"
require "faraday"

RSpec.describe ChessApi::StreamerResource do
  let(:stub_request) do
    Faraday::Adapter::Test::Stubs.new do |stub|
      stub.get(path) { |env| stub_response }
    end
  end
  let(:mock_client) { ChessApi::Client.new(adapter: :test, stubs: stub_request) }
  let(:username) { "test_username" }
  let(:stub_response) { [200, {"content-type" => "application/json"}, File.read(fixture_path)] }

  context "#list" do
    let(:path) { "pub/streamers" }
    let(:fixture_path) { "spec/fixtures/streamers/list.json" }

    it "returns a collection of streamers" do
      streamers_list = mock_client.streamer.list

      expect(streamers_list.class).to eq(ChessApi::Collection)
      expect(streamers_list.data.size).to eq(3)
      expect(streamers_list.data.first.class).to eq(ChessApi::Streamer)
    end
  end
end
