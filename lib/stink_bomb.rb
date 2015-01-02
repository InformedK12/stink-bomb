require 'time'
require 'stink_bomb/version'
require 'stink_bomb/configuration'
require 'stink_bomb/raise_bomb'

module StinkBomb
  class StinkyCodeError < StandardError; end

  class << self
    def create(datetime, message: nil)
      bombs.each { |bomb| bomb.trigger(datetime, message: message) }
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
end
