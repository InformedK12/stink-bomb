module StinkBomb
  class Configuration
    attr_accessor :message

    def initialize(options = {})
      self.message = options.fetch(:message) { default_message }
    end

  private

    def default_message
      'Your code stinks! It was supposed to be fixed by {time}'
    end
  end
end
