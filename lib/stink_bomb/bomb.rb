module StinkBomb
  class Bomb
    def past_deadline?(deadline)
      Time.now.utc > deadline.utc
    end
  end
end
