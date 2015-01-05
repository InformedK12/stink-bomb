module StinkBomb
  class Bomb
    def past_deadline?
      Time.now.utc > deadline.utc
    end
  end
end
