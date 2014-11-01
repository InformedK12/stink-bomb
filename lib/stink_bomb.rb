require 'time'
require 'stink_bomb/version'
require 'stink_bomb/bomb'

class StinkBomb
  def self.create(datetime, message: nil)
    StinkBomb::Bomb.new(datetime, message: message)
  end
end
