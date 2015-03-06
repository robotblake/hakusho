# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hakusho/version"

Gem::Specification.new do |spec|
  spec.name          = "hakusho"
  spec.version       = Hakusho::VERSION
  spec.authors       = ["Blake Imsland"]
  spec.email         = ["blake@retroco.de"]

  spec.summary       = "fast uuid generation and parsing library"
  spec.description   = "fast uuid generation and parsing library"
  spec.homepage      = "https://github.com/robotblake/hakusho"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.4"

  spec.add_development_dependency "pry-byebug", "~> 3.0.1"
  spec.add_development_dependency "guard-rspec", "~> 4.5.0"
end
