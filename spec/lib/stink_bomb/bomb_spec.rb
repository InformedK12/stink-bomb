class StinkBomb
  describe Bomb, '#initialize' do
    it 'does nothing if today is given' do
      expect do
        Bomb.new(Date.today)
      end.not_to raise_error
    end

    it 'raises an error if the given date is after today' do
      yesterday = Date.today - 1
      expect do
        Bomb.new(yesterday)
      end.to raise_error(/stinks! It was supposed to be fixed by #{yesterday}/)
    end

    it 'raises an error if the parameter is not a date or a string' do
      expect do
        Bomb.new(1)
      end.to raise_error('Parameter has to be a Date or a String')
    end
  end
end
