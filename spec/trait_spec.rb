require_relative 'spec_helper'

describe Trait do

  context 'Creation of traits' do

    before(:each) do
      Crowd.create()
      Person.create(name: "Fred",
                   trait1Answer: "Yes",
                   crowd_id: Crowd.first.id)
    end

    it 'should be able to create a hat trait' do
      expect(Trait.count).to eq(0)
      trait = Trait.create(description: "Hat",
                           answer: "Yes")
      expect(trait).to be_truthy
      expect(Trait.count).to eq(1)
      expect(trait.description).to eq ('Hat')
      expect(trait.answer).to eq ('Yes')
    end

    it 'should be able to create a hair colour trait' do
      expect(Trait.count).to eq(0)
      trait = Trait.create(description: "Hair Colour",
                           answer: "Black")
      expect(trait).to be_truthy
      expect(Trait.count).to eq(1)
      expect(trait.description).to eq ('Hair Colour')
      expect(trait.answer).to eq ('Black')
    end


  end
end
