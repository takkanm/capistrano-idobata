# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/idobata/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-idobata"
  spec.version       = Capistrano::Idobata::VERSION
  spec.authors       = ["Mitsutaka Mimura"]
  spec.email         = ["takkanm@gmail.com"]
  spec.summary       = %q{Capistrano 3 integration with Idobata}
  spec.description   = %q{Capistrano 3 integration with Idobata}
  spec.homepage      = "https://github.com/takkanm/capistrano-idobata"
  spec.license       = "MIT"

  spec.add_dependency 'capistrano', '~> 3.0'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
