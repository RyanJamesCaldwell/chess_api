# ChessApi

`chess_api` is a gem that wraps [Chess.com's Published-Data API](https://www.chess.com/news/view/published-data-api).
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'chess_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install chess_api

## Usage

To interact with the `ChessApi`, you'll first need to create a client object. You have the option of specifying a [Faraday adapter](https://lostisland.github.io/faraday/adapters/).

```ruby
client = ChessApi::Client.new
# or
client = ChessApi::Client.new(adapter: your_adapter_here)
```

From there, you'll be able to perform several operations:

### Fetch a player on Chess.com by username

```ruby
irb(main):001:0> player = ChessApi::Client.new.get_player(username: "RyanJCaldwell")

=> #<ChessApi::Player:0x000000013a8102f0 @attributes=#<OpenStruct player_id=58419494, @id="https://api.chess.com/pub/player/ryanjcaldwell", url="https://www.chess.com/member/RyanJCaldwell", name="Ryan Caldwell", username="ryanjcaldwell", followers=8, country="https://api.chess.com/pub/country/US", last_online=1630532095, joined=1552396179, status="basic", is_streamer=false>>
irb(main):002:0> player.username
=> "ryanjcaldwell"

irb(main):003:0> player.url
=> "https://www.chess.com/member/RyanJCaldwell"

irb(main):004:0> player.is_streamer
=> false
```

As you can see in the example above, you can access the fields returned by the Chess.com API through standard Ruby method syntax.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RyanJamesCaldwell/chess_api.


## License

The gem is available as open source under the terms of the MIT License.
