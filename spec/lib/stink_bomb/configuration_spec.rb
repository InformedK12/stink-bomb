module StinkBomb
  describe Configuration, '#bombs' do
    let(:configuration) { StinkBomb::Configuration.new }

    it 'returns an array of the currently assigned bombs' do
      expect(configuration.bombs).to eq []
      configuration.raise = true
      expect(configuration.bombs.length).to eq 1
    end
  end

  describe Configuration, '#raise=' do
    let(:yesterday) { (Date.today - 1).to_time }

    let(:configuration) { StinkBomb::Configuration.new }

    it 'removes any raise bombs when given false' do
      configuration.bombs << RaiseBomb.new
      configuration.raise = false
      expect(configuration.bombs).to be_empty
    end

    it 'adds a bomb that raises a stinky error' do
      configuration.raise = true
      expect do
        configuration.bombs.first.trigger(yesterday)
      end.to raise_error(StinkyCodeError)
    end

    it 'adds a bomb that raises a specific error class when given' do
      configuration.raise = StinkyTestError
      expect do
        configuration.bombs.first.trigger(yesterday)
      end.to raise_error(StinkyTestError)
    end
  end
end
