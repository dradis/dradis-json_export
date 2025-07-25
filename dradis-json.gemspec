$:.push File.expand_path('../lib', __FILE__)
require 'dradis/plugins/json/version'
version = Dradis::Plugins::JSON::VERSION::STRING

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.platform = Gem::Platform::RUBY
  spec.name = 'dradis-json'
  spec.version = version
  spec.summary = 'JSON export plugin for the Dradis Framework.'
  spec.description = 'This plugin allows you to export your Dradis results in JSON format.'

  spec.license = 'GPL-2'

  spec.authors = ['Rachael Korinek']
  spec.homepage = 'http://dradis.com'

  spec.files = `git ls-files`.split($\)
  spec.executables = spec.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_dependency 'dradis-plugins', '~> 4.0'

  spec.add_development_dependency 'bundler', '~> 2'
  spec.add_development_dependency 'rake', '~> 10.0'

  spec.add_development_dependency 'rspec-rails'
end
