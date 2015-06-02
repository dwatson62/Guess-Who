describe PersonTraits do

  context 'Creation' do

    it 'should be able to match a person with a trait' do
      april = Crowd.create()
      person = Person.create(name: "Fred",
                             crowd_id: april.id)
      hat = Trait.create(description: "Hat",
                   answer: "Yes",)
      PersonTraits.create(person_id: person.id,
                          trait_id: hat.id)
      expect(PersonTraits.count).to eq 1
    end
  end
end