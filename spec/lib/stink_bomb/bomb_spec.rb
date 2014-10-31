class StinkBomb
  describe Bomb, '#initialize' do
    it 'does nothing if tomorrow is given' do
      expect do
        Bomb.new(Date.today + 1)
      end.not_to raise_error
    end

    it 'does nothing if now + epsilon is given' do
      expect do
        Bomb.new(Time.now.getlocal + 1)
      end.not_to raise_error
    end

    it 'does not raise an error in production' do
      expect(ENV).to receive(:[]).with('RAILS_ENV').and_return('production')

      expect do
        Bomb.new(Date.today - 1)
      end.not_to raise_error
    end

    it 'raises a custom message when specified' do
      yesterday = Date.today - 1
      expect do
        Bomb.new(yesterday, 'Smells like poo')
      end.to raise_error(/Smells like poo/)
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
      end.to raise_error('Parameter has to be a Time, Date, or a String')
    end
  end
end
