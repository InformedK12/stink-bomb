class StinkBomb
  class Bomb
    attr_accessor :datetime

    def initialize(datetime)
      self.datetime = parse(datetime)
      fail fail_message if !production? && DateTime.now > self.datetime
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
  end
end
