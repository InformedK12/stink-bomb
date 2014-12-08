describe StinkBomb do
  describe '.create' do
    it 'creates an instance of Bomb with the parameters' do
      receive_expected = receive(:new).with('01/01/2100', message: nil)
      expect(StinkBomb::Bomb).to receive_expected.and_call_original
      expect_any_instance_of(StinkBomb::Bomb).to receive(:trigger)
      StinkBomb.create('01/01/2100')
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
