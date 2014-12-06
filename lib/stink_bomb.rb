require 'time'
require 'stink_bomb/version'
require 'stink_bomb/configuration'
require 'stink_bomb/bomb'

module StinkBomb
  def self.create(datetime, message: nil)
    StinkBomb::Bomb.new(datetime, message: message).trigger
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield configuration if block_given?
  end

  def self.reset
    @configuration = nil
  end
end
