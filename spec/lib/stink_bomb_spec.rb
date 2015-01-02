describe StinkBomb do
  describe '.create' do
    let(:configuration) { StinkBomb.configuration }

    context 'when there are bombs configured' do
      it 'triggers the configured bombs' do
        configuration.raise = true
        expect do
          StinkBomb.create('01/01/1900')
        end.to raise_error(StinkBomb::StinkyCodeError)
      end
    end

    context 'when there are no bombs triggered' do
      it 'does nothing' do
        expect do
          StinkBomb.create('01/01/1900')
        end.not_to raise_error
      end
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
