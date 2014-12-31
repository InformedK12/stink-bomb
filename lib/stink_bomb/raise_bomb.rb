module StinkBomb
  class RaiseBomb
    attr_accessor :time
    attr_writer :message

    def initialize(error_class: StinkyCodeError)
      @error_class = error_class
    end

    def trigger(time, message: StinkBomb.configuration.message)
      self.time = parse(time)

      fail error(message) if !production? && past_time?
    end

  private

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

    def error(message)
      @error_class.new(message.gsub('{time}', time.to_s))
    end
  end
end
