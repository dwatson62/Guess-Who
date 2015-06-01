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
      hat = Trait.create(description: "Hat",
                   answer: "Yes",)
      PersonTraits.create(person_id: fred.id,
                          trait_id: hat.id)
      PersonTraits.create(person_id: boris.id,
                          trait_id: hat.id)
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

  context 'player can ask' do
    it 'who has a hat' do
      answer = subject.who_has('Hat')
      expect(answer[0].name).to eq ("Boris")
      expect(answer[1].name).to eq ("Fred")
    end
  end
end
