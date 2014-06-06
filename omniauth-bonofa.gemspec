# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/bonofa/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-bonofa"
  spec.version       = Omniauth::Bonofa::VERSION
  spec.authors       = ["Ruo"]
  spec.email         = ["siera04@gmail.com"]
  spec.description   = "Bonofa strategy for Omniauth"
  spec.summary       = "Bonofa strategy for Omniauth"
  spec.homepage      = "https://github.com/c7devteam/bonofa_main_omniauth"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1.1.1'
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'mocha'
end
