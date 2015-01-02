require 'time'
require 'stink_bomb/version'
require 'stink_bomb/configuration'
require 'stink_bomb/raise_bomb'

module StinkBomb
  class StinkyCodeError < StandardError; end

  class << self
    def create(deadline, message: nil)
      deadline = parse(deadline)
      bombs.each { |bomb| bomb.trigger(deadline, message: message) }
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

    def reset
      @configuration = nil
    end

    def bombs
      configuration.bombs
    end
  end

private

  def self.parse(time)
    if time.is_a?(String)
      Time.parse(time)
    elsif time.respond_to?(:to_time)
      time.to_time
    else
      fail 'Parameter has to be a Time, Date, or a String'
    end
  end
end
