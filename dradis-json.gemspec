$:.push File.expand_path('../lib', __FILE__)
require 'dradis/plugins/json/version'
version = Dradis::Plugins::Json::VERSION::STRING


# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.platform      = Gem::Platform::RUBY
  spec.name = 'dradis-json'
  spec.version = version
  spec.summary = 'JSON export plugin for the Dradis Framework.'
  spec.description = 'This plugin allows you to export your Dradis results in JSON format.'

  spec.license = 'GPL-2'

  spec.authors = ['Rachael Korinek']
  spec.email = ['rachael.korinek@gmail.com']
  spec.homepage = 'http://dradisframework.org'

  spec.files = `git ls-files`.split($\)
  spec.executables = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_dependency 'dradis-plugins', '~> 3.5'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_development_dependency 'rspec-rails'#, '~> 3.0.0'
end
