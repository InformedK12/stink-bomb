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
    let(:configuration) { StinkBomb::Configuration.new }
    let(:message) { configuration.message }
    let(:yesterday) { (Date.today - 1).to_time }

    it 'removes any raise bombs when given false' do
      configuration.bombs << RaiseBomb.new
      configuration.raise = false
      expect(configuration.bombs).to be_empty
    end

    it 'adds a bomb that raises a stinky error' do
      configuration.raise = true
      expect do
        configuration.bombs.first.trigger(yesterday, message: message)
      end.to raise_error(StinkyCodeError)
    end

    it 'adds a bomb that raises a specific error class when given' do
      configuration.raise = StinkyTestError
      expect do
        configuration.bombs.first.trigger(yesterday, message: message)
      end.to raise_error(StinkyTestError)
    end
  end

  describe Configuration, '#logger=' do
    let(:configuration) { StinkBomb::Configuration.new }
    let(:message) { configuration.message }
    let(:fake_logger) { double(info: 'foo') }
    let(:yesterday) { (Date.today - 1).to_time }

    it 'removes any logger bombs when given false' do
      configuration.bombs << RaiseBomb.new
      configuration.bombs << LoggerBomb.new(fake_logger)
      configuration.logger = false
      expect(configuration.bombs.length).to eq 1
      expect(configuration.bombs.first).to be_a RaiseBomb
    end

    it 'adds a bomb that logs to the rails logger' do
      stub_const('Rails', double(logger: fake_logger))
      configuration.logger = true
      configuration.bombs.first.trigger(yesterday, message: message)

      expect(fake_logger).to have_received(:info).with(/Your code stinks!/)
    end

    it 'adds a bomb that logs to a custom logger' do
      configuration.logger = fake_logger
      configuration.bombs.first.trigger(yesterday, message: message)

      expect(fake_logger).to have_received(:info).with(/Your code stinks!/)
    end
  end
end
