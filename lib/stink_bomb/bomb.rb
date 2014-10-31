class StinkBomb
  class Bomb
    attr_accessor :datetime

    def initialize(datetime, message = nil)
      self.datetime = parse(datetime)
      fail (message || fail_message) if !production? && past_datetime?
    end

    def parse(datetime)
      datetime = DateTime.parse(datetime) if datetime.is_a?(String)
      unless datetime.respond_to?(:to_datetime)
        fail 'Parameter has to be a Time, Date, or a String'
      end

      datetime.to_datetime
    end

    def fail_message
      "Your code stinks! It was supposed to be fixed by #{datetime}"
    end

    def production?
      ENV['RAILS_ENV'] == 'production' || ENV['RACK_ENV'] == 'production'
    end

    def past_datetime?
      Time.now.getlocal.to_datetime > datetime
    end
  end
end
