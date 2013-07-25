# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cerberus/version'

Gem::Specification.new do |spec|
  spec.name          = 'cerberus'
  spec.version       = Cerberus::VERSION
  spec.authors       = ['lab2023', 'Onur Özgür ÖZKAN']
  spec.email         = %w(info@lab2023.com onur.ozgur.ozkan@lab2023.com)
  spec.description   = %q{Write a gem description}
  spec.summary       = %q{Write a gem summary}
  spec.homepage      = 'https://github.com/kebab-project/cerberus'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'

  spec.add_runtime_dependency 'mail'
  spec.add_runtime_dependency 'activemodel', '>= 0'
end
