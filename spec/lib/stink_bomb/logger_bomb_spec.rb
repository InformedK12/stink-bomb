module StinkBomb
  describe LoggerBomb, '#initialize' do
    let(:fake_logger) { double(info: 'foo') }
    let(:yesterday) { (Date.today - 1).to_time }
    let(:message) { StinkBomb.configuration.message }

    it 'accepts a custom logger' do
      LoggerBomb.new(fake_logger).trigger(yesterday, message: message)

      expect(fake_logger).to have_received(:info).with(/Your code stinks!/)
    end

    it 'defaults to the Rails logger' do
      stub_const('Rails', double(logger: fake_logger))

      LoggerBomb.new.trigger(yesterday, message: message)

      expect(fake_logger).to have_received(:info).with(/Your code stinks!/)
    end

    it 'fails if no valid logger is given or found' do
      expect { LoggerBomb.new }.to raise_error(/logger.*required/)
    end
  end

  describe LoggerBomb, '#trigger' do
    let(:fake_logger) { double(info: 'foo') }
    let(:logger_bomb) { LoggerBomb.new(fake_logger) }
    let(:message) { StinkBomb.configuration.message }
    let(:yesterday) { (Date.today - 1).to_time }
    let(:tomorrow) { (Date.today + 1).to_time }

    it 'does nothing if tomorrow is given' do
      logger_bomb.trigger(tomorrow, message: message)

      expect(fake_logger).not_to have_received(:info).with(/Your code stinks!/)
    end

    it 'does nothing if now + epsilon is given' do
      logger_bomb.trigger(Time.now.getlocal + 1, message: message)

      expect(fake_logger).not_to have_received(:info).with(/Your code stinks!/)
    end

    it 'logs a message if the given date is before today' do
      logger_bomb.trigger(yesterday, message: message)

      expect(fake_logger).to have_received(:info).with(/Your code stinks!/)
    end
  end
end
