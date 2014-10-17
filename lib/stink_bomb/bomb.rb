module StinkBomb
  class Bomb
    def initialize(date)
      date = Date.parse(date) if date.is_a?(String)
      fail 'Parameter has to be a Date or a String' unless date.is_a?(Date)

      fail_message = "Your code stinks! It was supposed to be fixed by #{date}"
      fail fail_message if Date.today > date
    end
  end
end
