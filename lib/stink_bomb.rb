require 'time'
require 'stink_bomb/version'
require 'stink_bomb/configuration'
require 'stink_bomb/raise_bomb'

module StinkBomb
  class StinkyCodeError < StandardError; end

  def self.create(datetime, message: nil)
    StinkBomb::RaiseBomb.new.trigger(datetime, message: message)
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration
  end

  def self.reset
    @configuration = nil
  end
end
