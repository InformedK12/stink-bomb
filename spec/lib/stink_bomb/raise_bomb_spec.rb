module StinkBomb
  describe RaiseBomb, '#initialize' do
    let(:message) { StinkBomb.configuration.message }
    let(:yesterday) { (Date.today - 1).to_time }

    it 'accepts an error class to raise' do
      raise_bomb = RaiseBomb.new(StinkyTestError)
      expect do
        raise_bomb.trigger(yesterday, message: message)
      end.to raise_error(StinkyTestError, /Your code stinks!/)
    end

    it 'raises a StinkyCodeError by default' do
      expect do
        RaiseBomb.new.trigger(yesterday, message: message)
      end.to raise_error(StinkyCodeError, /Your code stinks!/)
    end
  end

  describe RaiseBomb, '#trigger' do
    let(:raise_bomb) { RaiseBomb.new }
    let(:message) { StinkBomb.configuration.message }
    let(:yesterday) { (Date.today - 1).to_time }
    let(:tomorrow) { (Date.today + 1).to_time }

    it 'does nothing if tomorrow is given' do
      expect do
        raise_bomb.trigger(tomorrow, message: message)
      end.not_to raise_error
    end

    it 'does nothing if now + epsilon is given' do
      expect do
        raise_bomb.trigger(Time.now.getlocal + 1, message: message)
      end.not_to raise_error
    end

    it 'raises an error if the given date is before today' do
      expect do
        raise_bomb.trigger(yesterday, message: message)
      end.to raise_error(/Your code stinks!/)
    end
  end
end
