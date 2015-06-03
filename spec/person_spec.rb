describe Person do
  context 'Creation' do
    it 'should be able to create a person with one trait' do
      april = Crowd.create
      Person.create(name: 'Fred',
                    crowd_id: april.id,
                    picture: '/images/fred.jpg')
      expect(Person.count).to eq(1)
    end
  end
end
