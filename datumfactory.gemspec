# frozen_string_literal: true

require_relative 'lib/datumfactory/version'

Gem::Specification.new do |spec|
  spec.name          = 'datumfactory'
  spec.version       = Datumfactory::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.summary       = 'Event tracking for your applications.'
  spec.description   = 'Track key events in your application.'
  spec.authors       = ['Rob Bazinet']
  spec.email         = ['rbazinet@stillriversoftware.com']
  spec.homepage      = 'https://github.com/rbazinet/datumfactory-ruby'
  spec.license       = 'MIT'

  spec.required_ruby_version = '>= 2.3.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/rbazinet/datumfactory-ruby'
  spec.metadata['changelog_uri'] = 'https://github.com/rbazinet/datumfactory-ruby'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httparty', '~> 0.18.1'
  # spec.executables << 'datumfactory'
end
