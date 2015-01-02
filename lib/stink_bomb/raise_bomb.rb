module StinkBomb
  class RaiseBomb
    attr_accessor :deadline
    attr_writer :message

    def initialize(error_class: StinkyCodeError)
      @error_class = error_class
    end

    def trigger(deadline, message: nil)
      message ||= StinkBomb.configuration.message
      self.deadline = deadline

      fail error(message) if past_deadline?
    end

  private

    def past_deadline?
      Time.now.utc > deadline.utc
    end

    def error(message)
      @error_class.new(message.gsub('{deadline}', deadline.to_s))
    end
  end
end
