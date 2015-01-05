module StinkBomb
  class Configuration
    attr_accessor :message

    def initialize(options = {})
      self.message = options.fetch(:message) { default_message }
    end

    def raise=(error_class)
      configure_bomb(RaiseBomb, error_class)
    end

    def logger=(logger)
      configure_bomb(LoggerBomb, logger)
    end

    def bombs
      @bombs ||= []
    end

  private

    def configure_bomb(bomb_type, bomb_arg)
      remove_bomb(bomb_type)
      if bomb_arg == true
        bombs << bomb_type.new
      elsif bomb_arg
        bombs << bomb_type.new(bomb_arg)
      end
    end

    def remove_bomb(bomb_class)
      bombs.delete_if { |bomb| bomb.is_a?(bomb_class) }
    end

    def default_message
      'Your code stinks! It was supposed to be fixed by {deadline}'
    end
  end
end
