require 'simplecov'
if ENV['CI']
  require 'codeclimate-test-reporter'
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    CodeClimate::TestReporter::Formatter
  ]
  SimpleCov.minimum_coverage 100
end
SimpleCov.start { add_filter '/spec/' }

require_relative '../lib/stink_bomb'

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.after(:each) { StinkBomb.reset }
end

class StinkyTestError < StandardError; end
