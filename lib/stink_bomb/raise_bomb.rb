module StinkBomb
  class RaiseBomb < Bomb
    attr_writer :message

    def initialize(error_class: StinkyCodeError)
      @error_class = error_class
    end

    def trigger(deadline, message:)
      fail @error_class, message if past_deadline?(deadline)
    end
  end
end
