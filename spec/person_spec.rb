require_relative 'spec_helper'

describe Person do

  context 'Creation' do

    it 'should be able to create a person with one trait' do
      april = Crowd.create()
      person = Person.create(name: "Fred",
                             crowd_id: april.id)
      expect(Person.count).to eq(1)
    end
  end
end