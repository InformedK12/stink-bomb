require 'simplecov'
if ENV['CI']
  require 'coveralls'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
end
SimpleCov.minimum_coverage 100
SimpleCov.start { add_filter '/spec/' }

require_relative '../lib/stink_bomb'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end

class StinkyTestError < StandardError; end
