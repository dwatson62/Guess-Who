require_relative 'spec_helper'

describe Person do

  context 'Creation of person' do

    it 'should be able to create a person with one trait' do
      april = Crowd.create()
      expect(Person.count).to eq(0)
      person = Person.create(name: "Fred",
                             trait1Answer: "Yes",
                             crowd_id: april.id)
      expect(person).to be_truthy
      expect(Person.count).to eq(1)
    end
  end
end