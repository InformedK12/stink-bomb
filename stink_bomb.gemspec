# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stink_bomb/version'

Gem::Specification.new do |spec|
  spec.name          = 'stink_bomb'
  spec.version       = StinkBomb::VERSION
  spec.authors       = ['Holman Gao']
  spec.email         = ['holman@golmansax.com']
  spec.summary       = 'Fail your CI when your code becomes stinky'
  spec.homepage      = 'https://github.com/ChalkSchools/stink-bomb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^(test|spec|features)\//)
  spec.require_paths = ['lib']
end
