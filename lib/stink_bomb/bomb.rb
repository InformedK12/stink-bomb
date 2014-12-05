class StinkBomb
  class Bomb
    attr_accessor :time

    def initialize(time, message: nil)
      self.time = parse(time)
      fail (message || fail_message) if !production? && past_time?
    end

    def parse(time)
      time = Time.parse(time) if time.is_a?(String)
      unless time.respond_to?(:to_time)
        fail 'Parameter has to be a Time, Date, or a String'
      end

      time.to_time
    end

    def fail_message
      "Your code stinks! It was supposed to be fixed by #{time}"
    end

    def production?
      ENV['RAILS_ENV'] == 'production' || ENV['RACK_ENV'] == 'production'
    end

    def past_time?
      Time.now.utc > time.utc
    end
  end
end
