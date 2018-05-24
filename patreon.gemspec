# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'patreon/version'

Gem::Specification.new do |gem|
  gem.name          = "patreon"
  gem.version       = Patreon::VERSION
  gem.authors       = ["Patreon"]
  gem.email         = ["david@patreon.com"]
  gem.description   = "Interact with the Patreon API via OAuth"
  gem.licenses      = ["Apache 2.0"]
  gem.summary       = "Visit patreon.com/oauth2/documentation for more information."
  gem.homepage      = "https://github.com/Patreon/patreon-ruby"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'json-api-vanilla', '~> 1.0.1'
  # left rack dependency to float because we're only using build_query, parse_query
  gem.add_dependency 'rack'

  gem.add_development_dependency 'minitest', '~> 5.11.3'
  gem.add_development_dependency 'minitest-hooks', '~> 1.0.1'
  gem.add_development_dependency 'minitest-junit', '~> 0.2.0'
  gem.add_development_dependency 'mocha', '~> 1.3.0'
  gem.add_development_dependency 'rake', '~> 12.3.0'
end
