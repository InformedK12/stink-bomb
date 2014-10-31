require 'time'
require 'stink_bomb/version'
require 'stink_bomb/bomb'

class StinkBomb
  def self.create(datetime, params = {})
    StinkBomb::Bomb.new(datetime, params)
  end
end
