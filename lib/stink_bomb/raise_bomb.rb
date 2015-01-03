module StinkBomb
  class RaiseBomb
    attr_accessor :deadline
    attr_writer :message

    def initialize(error_class: StinkyCodeError)
      @error_class = error_class
    end

    def trigger(deadline, message:)
      self.deadline = deadline

      fail @error_class, message if past_deadline?
    end

  private

    def past_deadline?
      Time.now.utc > deadline.utc
    end
  end
end
