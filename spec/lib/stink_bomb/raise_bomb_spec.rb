module StinkBomb
  describe RaiseBomb, '#initialize' do
    let(:yesterday) { (Date.today - 1).to_time }

    it 'accepts an error class to raise' do
      expect do
        RaiseBomb.new(error_class: StinkyTestError).trigger(yesterday)
      end.to raise_error(StinkyTestError, /Your code stinks!/)
    end

    it 'raises a StinkyCodeError by default' do
      expect do
        RaiseBomb.new.trigger(yesterday)
      end.to raise_error(StinkyCodeError, /Your code stinks!/)
    end
  end

  describe RaiseBomb, '#trigger' do
    let(:raise_bomb) { RaiseBomb.new }
    let(:yesterday) { (Date.today - 1).to_time }
    let(:tomorrow) { (Date.today + 1).to_time }

    it 'does nothing if tomorrow is given' do
      expect do
        raise_bomb.trigger(tomorrow)
      end.not_to raise_error
    end

    it 'does nothing if now + epsilon is given' do
      expect do
        raise_bomb.trigger(Time.now.getlocal + 1)
      end.not_to raise_error
    end

    it 'raises a custom message when specified' do
      expect do
        raise_bomb.trigger(yesterday, message: 'Smells like poo')
      end.to raise_error(/Smells like poo/)
    end

    it 'raises an error if the given date is after today' do
      expect do
        raise_bomb.trigger(yesterday)
      end.to raise_error(/It was supposed to be fixed by #{yesterday.utc}/)
    end
  end
end
