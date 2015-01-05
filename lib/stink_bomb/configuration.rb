module StinkBomb
  class Configuration
    attr_accessor :message

    def initialize(options = {})
      self.message = options.fetch(:message) { default_message }
    end

    def raise=(error_class)
      remove_bomb(RaiseBomb)
      if error_class == true
        add_bomb(RaiseBomb.new)
      elsif error_class
        add_bomb(RaiseBomb.new(error_class: error_class))
      end
    end

    def logger=(logger)
      remove_bomb(LoggerBomb)
      if logger == true
        add_bomb(LoggerBomb.new)
      elsif logger
        add_bomb(LoggerBomb.new(logger))
      end
    end

    def bombs
      @bombs ||= []
    end

  private

    def add_bomb(bomb)
      bombs << bomb
    end

    def remove_bomb(bomb_class)
      bombs.delete_if { |bomb| bomb.is_a?(bomb_class) }
    end

    def default_message
      'Your code stinks! It was supposed to be fixed by {deadline}'
    end
  end
end
