# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wax/version'

Gem::Specification.new do |spec|
  spec.name          = "wax"
  spec.version       = Wax::VERSION
  spec.authors       = ["Mike Anderson"]
  spec.email         = ["mike.anderson@space150.com"]
  spec.summary       = %q{Use the same templates on the front and back ends.}
  spec.homepage      = "http://space150.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "mustache", "~> 0.99.6"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "guard", "~> 2.6.1"
  spec.add_development_dependency "guard-minitest", "~> 2.3.2"
end
