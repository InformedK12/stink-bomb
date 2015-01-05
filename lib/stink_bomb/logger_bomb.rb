module StinkBomb
  class LoggerBomb < Bomb
    attr_accessor :deadline

    def initialize(logger = nil)
      logger ||= Rails.logger if defined?(Rails)
      fail 'logger responding to "info" is required' unless logger
      @logger = logger
    end

    def trigger(deadline, message:)
      self.deadline = deadline

      @logger.info(message) if past_deadline?
    end
  end
end
