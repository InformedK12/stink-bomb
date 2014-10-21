require 'date'
require 'stink_bomb/version'
require 'stink_bomb/bomb'

class StinkBomb
  def self.create(*args)
    StinkBomb::Bomb.new *args
  end
end
