# ChessApi

`chess_api` is a gem that wraps [Chess.com's Published-Data API](https://www.chess.com/news/view/published-data-api).

[![Gem Version](https://badge.fury.io/rb/chess_api.svg)](https://badge.fury.io/rb/chess_api)
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
irb(main):018:0> player = client.player.retrieve(username: "GothamChess")
=>
#<ChessApi::Player:0x000000013bc41198
...

irb(main):019:0> player.username
=> "gothamchess"

irb(main):020:0> player.title
=> "IM"

irb(main):021:0> player.is_streamer
=> true

irb(main):022:0> player.twitch_url
=> "https://twitch.tv/GothamChess"
```

As you can see in the example above, you can access the fields returned by the Chess.com API through standard Ruby method syntax.

### Fetching a list of players with a particular title on Chess.com

```ruby
irb(main):001:0> client.titled_player.with_title(title_abbreviation: "WGM")
=>
#<ChessApi::Collection:0x000000013ecc78d0
 @data=
  [#<ChessApi::TitledPlayer:0x000000013f175d78 @attributes=#<OpenStruct username="abrahamyan-la">>,
   #<ChessApi::TitledPlayer:0x000000013f175620 @attributes=#<OpenStruct username="adriananikolova">>,
   #<ChessApi::TitledPlayer:0x000000013f175260 @attributes=#<OpenStruct username="advantagelucy">>,
   #<ChessApi::TitledPlayer:0x000000013f174ec8 @attributes=#<OpenStruct username="ahachess">>,
   ...
  ]
```

### Fetching a player's online status on Chess.com
```ruby
irb(main):001:0> client.player.online_status(username: "hikaru")
=> "offline"

irb(main):002:0> client.player.online_status(username: "ryanjcaldwell")
=> "online"
```

### Fetching the clubs that a player belongs to on Chess.com
```ruby
irb(main):001:0> clubs = client.player.clubs(username: "GothamChess")
=>
#<ChessApi::Collection:0x000000015dbe5998
...

irb(main):002:0> clubs.data.map { |club| [club.name, club.joined] }
=>
[["Chess.comTV", 1533262149],
 ["Hikaru Nakamura Fan Club", 1547248727],
 ["Chess.com Beta", 1572489771],
 ["PRO Chess League", 1547048660],
 ["Streamers", 1533671931],
 ["4 Player Chess", 1533746676],
 ["Gotham's Mob", 1528247350],
 ["Arena Kings Championship Season 5", 1575824630],
 ["Marshall Chess Club Official - Match Team", 1587681476],
 ["Fiona's Fight Club", 1616428995]]
```

### Fetching the monthly game archive links for a player on Chess.com
```ruby
irb(main):001:0> result = client.monthly_game_archive.list(username: "ryanjcaldwell")
=>
#<ChessApi::Collection:0x0000000153351480
...

irb(main):002:0> result.data.first.url
=> "https://api.chess.com/pub/player/ryanjcaldwell/games/2019/03"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RyanJamesCaldwell/chess_api.


## License

The gem is available as open source under the terms of the MIT License.
