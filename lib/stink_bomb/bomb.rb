module StinkBomb
  class Bomb
    attr_accessor :time
    attr_writer :message

    def initialize(time, message: nil)
      self.time = parse(time)
      self.message = message || StinkBomb.configuration.message
    end

    def trigger
      fail message if !production? && past_time?
    end

    def parse(time)
      time = Time.parse(time) if time.is_a?(String)
      unless time.respond_to?(:to_time)
        fail 'Parameter has to be a Time, Date, or a String'
      end

      time.to_time
    end

    def production?
      ENV['RAILS_ENV'] == 'production' || ENV['RACK_ENV'] == 'production'
    end

    def past_time?
      Time.now.utc > time.utc
    end

    def message
      @message.gsub('{time}', time.to_s)
    end
  end
end
