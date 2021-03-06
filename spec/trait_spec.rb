describe Trait do
  context 'Creation' do
    before(:each) do
      Crowd.create
      Person.create(name: 'Fred',
                    crowd_id: Crowd.first.id)
    end

    it 'should be able to create a hat trait' do
      Trait.create(description: 'Hat')
      expect(Trait.count).to eq(1)
    end

    it 'should be able to create a hair colour trait' do
      Trait.create(description: 'Hair Colour')
      expect(Trait.count).to eq(1)
    end
  end
end
