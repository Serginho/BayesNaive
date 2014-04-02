# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bayesnaive/version'

Gem::Specification.new do |spec|
  spec.name          = "bayesnaive"
  spec.version       = Bayesnaive::VERSION
  spec.authors       = ["Sergio Cancelo"]
  spec.email         = ["yo@sergiocancelo.es"]
  spec.description   = %q{Implementation of Bayes Naïve algorithm to classify documents that's written in spanish language.}
  spec.summary       = %q{Implementation of Bayes Naïve algorithm to classify documents that's written in spanish language}
  spec.homepage      = "http://www.sergiocancelo.es/"
  spec.license       = "LGPL"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
