require 'date'
require 'stink_bomb/version'
require 'stink_bomb/bomb'

class StinkBomb
  def self.create(date)
    StinkBomb::Bomb.new(date)
  end
end
