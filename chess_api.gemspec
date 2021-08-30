# frozen_string_literal: true

require_relative "lib/chess_api/version"

Gem::Specification.new do |spec|
  spec.name          = "chess_api"
  spec.version       = ChessApi::VERSION
  spec.authors       = ["Ryan Caldwell"]
  spec.email         = ["ryanjcaldwell4@gmail.com"]

  spec.summary       = "chess_api is a gem that wraps the Chess.com API."
  spec.description   = "chess_api is a gem that wraps the Chess.com API."
  spec.homepage      = "https://github.com/RyanJamesCaldwell/chess_api"
  spec.required_ruby_version = ">= 2.4.0"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/RyanJamesCaldwell/chess_api/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.7"
  spec.add_dependency "faraday_middleware", "~> 1.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
