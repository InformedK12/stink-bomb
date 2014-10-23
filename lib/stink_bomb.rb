require 'time'
require 'stink_bomb/version'
require 'stink_bomb/bomb'

class StinkBomb
  def self.create(datetime)
    StinkBomb::Bomb.new(datetime)
  end
end
