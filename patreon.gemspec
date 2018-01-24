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

  gem.add_runtime_dependency 'json-api-vanilla', '~> 1.0.1'
end
