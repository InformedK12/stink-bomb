describe StinkBomb do
  describe '.create' do
    let(:configuration) { StinkBomb.configuration }
    let(:yesterday) { (Date.today - 1).to_time }

    it 'triggers the configured bombs when there are bombs configured' do
      configuration.raise = true
      expect do
        StinkBomb.create('01/01/1900')
      end.to raise_error(StinkBomb::StinkyCodeError)
    end

    it 'does nothing when there are no bombs triggered' do
      expect { StinkBomb.create('01/01/1900') }.not_to raise_error
    end

    it 'accepts a date object' do
      configuration.raise = true
      expect do
        StinkBomb.create(yesterday)
      end.to raise_error(StinkBomb::StinkyCodeError)
    end

    it 'accepts a time object' do
      configuration.raise = true
      expect do
        StinkBomb.create(Time.now.getlocal - 86_400)
      end.to raise_error(StinkBomb::StinkyCodeError)
    end

    it 'raises an error if the time is not a date or a string' do
      expect do
        StinkBomb.create(1)
      end.to raise_error('Parameter has to be a Time, Date, or a String')
    end

    it 'raises an error if the given date is after today' do
      configuration.raise = true
      yesterday_string = Regexp.quote(yesterday.to_s)
      expect do
        StinkBomb.create(yesterday)
      end.to raise_error(/It was supposed to be fixed by #{yesterday_string}/)
    end

    it 'raises a custom message when specified' do
      configuration.raise = true
      yesterday_string = Regexp.quote(yesterday.to_s)
      expect do
        StinkBomb.create(yesterday, message: '{deadline} Smells like poo')
      end.to raise_error(/#{yesterday_string} Smells like poo/)
    end
  end

  describe '.configuration' do
    it 'returns the same object every time' do
      expect(StinkBomb.configuration).to equal(StinkBomb.configuration)
    end
  end

  describe '.configure' do
    it 'yields the current configuration' do
      StinkBomb.configure do |configuration|
        expect(configuration).to equal(StinkBomb.configuration)
      end
    end
  end

  describe '.reset' do
    it 'resets the configuration' do
      old_configuration = StinkBomb.configuration
      StinkBomb.reset
      expect(StinkBomb.configuration).not_to equal(old_configuration)
    end
  end
end
