require_relative 'spec_helper'
require './app/server'
require './app/models/player'
require 'byebug'

describe Player do

  before(:each) do
      Crowd.create()
      fred = Person.create(name: "Fred",
                    crowd_id: Crowd.first.id)
      boris = Person.create(name: "Boris",
                    crowd_id: Crowd.first.id)
      john = Person.create(name: "John",
                    crowd_id: Crowd.first.id)
      hat = Trait.create(description: "Hat",
                   answer: "Yes",)
      PersonTraits.create(person_id: fred.id,
                          trait_id: hat.id)
      PersonTraits.create(person_id: boris.id,
                          trait_id: hat.id)
  end

  context 'on creation' do
    it 'has a crowd of 3' do
      expect(subject.crowd.length).to eq 3
    end
  end


  context 'can choose' do

    it { is_expected.to respond_to(:choose).with(1).argument }

    it 'his character' do
      subject.choose("Fred")
      expect(subject.character.name).to eq("Fred")
    end
  end

  context 'cannot choose' do

    it 'a character that does not exist' do
      expect { subject.choose('Frank') }.to raise_error "Character not found"
    end
  end

  context 'player can ask if he has a hat' do
    it 'and will return the crowd wearing a hat if yes' do
      subject.choose('Fred')
      expect(subject.who_has('Hat')).to eq 'Yes'

      # expect(subject.crowd.all(up: true).length).to eq 2
    end
    it 'and will return the crowd not wearing a hat if no' do
      subject.choose('John')
      expect(subject.who_has('Hat')).to eq 'No'
      # expect(subject.crowd.all(up: true).length).to eq 2
    end
  end
end
