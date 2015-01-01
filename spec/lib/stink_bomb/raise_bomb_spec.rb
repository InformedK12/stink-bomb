module StinkBomb
  describe RaiseBomb, '#initialize' do
    it 'accepts an error class to raise' do
      expect do
        RaiseBomb.new(error_class: StinkyTestError).trigger(Date.today - 1)
      end.to raise_error(StinkyTestError, /Your code stinks!/)
    end

    it 'raises a StinkyCodeError by default' do
      expect do
        RaiseBomb.new.trigger(Date.today - 1)
      end.to raise_error(StinkyCodeError, /Your code stinks!/)
    end
  end

  describe RaiseBomb, '#trigger' do
    let(:raise_bomb) { RaiseBomb.new }

    it 'raises an error if the parameter is not a date or a string' do
      expect do
        raise_bomb.trigger(1)
      end.to raise_error('Parameter has to be a Time, Date, or a String')
    end

    it 'does nothing if tomorrow is given' do
      expect do
        raise_bomb.trigger(Date.today + 1)
      end.not_to raise_error
    end

    it 'does nothing if now + epsilon is given' do
      expect do
        raise_bomb.trigger(Time.now.getlocal + 1)
      end.not_to raise_error
    end

    it 'raises a custom message when specified' do
      yesterday = Date.today - 1
      expect do
        raise_bomb.trigger(yesterday, message: 'Smells like poo')
      end.to raise_error(/Smells like poo/)
    end

    it 'raises an error if the given date is after today' do
      yesterday = Date.today - 1
      expect do
        raise_bomb.trigger(yesterday)
      end.to raise_error(/stinks! It was supposed to be fixed by #{yesterday}/)
    end
  end
end
