# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'esbit/version'

Gem::Specification.new do |spec|
  spec.name          = "esbit"
  spec.version       = Esbit::VERSION
  spec.authors       = ["Bradly Feeley"]
  spec.email         = ["bradlyf@gmail.com"]
  spec.description   = %q{A lightweight gem to interact with the Campfire API}
  spec.summary       = %q{A lightweight gem to interact with the Campfire API}
  spec.homepage      = "https://github.com/bradly/esbit"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
