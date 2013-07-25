# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kangal/version'

Gem::Specification.new do |spec|
  spec.name          = 'kangal'
  spec.version       = Kangal::VERSION
  spec.authors       = ['lab2023', 'Onur Özgür ÖZKAN']
  spec.email         = %w(info@lab2023.com onur.ozgur.ozkan@lab2023.com)
  spec.description   = %q{Kangal brings you a nice set of custom validators for Rails 4.}
  spec.summary       = %q{Kangal brings you a nice set of custom validators for Rails 4.}
  spec.homepage      = 'https://github.com/kebab-project/kangal'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'

  spec.add_runtime_dependency 'mail'
  spec.add_runtime_dependency 'activemodel', '>= 0'
end
