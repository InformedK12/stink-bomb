module StinkBomb
  class RaiseBomb
    attr_accessor :time
    attr_writer :message

    def initialize(error_class: StinkyCodeError)
      @error_class = error_class
    end

    def trigger(time, message: nil)
      message ||= StinkBomb.configuration.message
      self.time = time

      fail error(message) if past_time?
    end

  private

    def past_time?
      Time.now.utc > time.utc
    end

    def error(message)
      @error_class.new(message.gsub('{time}', time.to_s))
    end
  end
end
