describe StinkBomb do
  describe '#create' do
    it 'creates an instance of Bomb with the parameters' do
      expect(StinkBomb::Bomb).to receive(:new).with('My date', nil)
      StinkBomb.create('My date')
    end
  end
end
