require_relative 'lib/datumfactory/version'

Gem::Specification.new do |spec|
  spec.name          = "datumfactory"
  spec.version       = Datumfactory::VERSION
  spec.summary       = 'Event tracking for your applications.'
  spec.description   = 'Track key events in your application.'
  spec.authors       = ["Rob Bazinet"]
  spec.email         = ["rbazinet@stillriversoftware.com"]
  spec.homepage      = "https://github.com/rbazinet/datumfactory-ruby"
  spec.license       = "MIT"

  spec.required_ruby_version = '>= 2.3.0'

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/rbazinet/datumfactory-ruby"
  spec.metadata["changelog_uri"] = "https://github.com/rbazinet/datumfactory-ruby"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
