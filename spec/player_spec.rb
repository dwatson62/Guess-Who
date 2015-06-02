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
      barry = Person.create(name: "Barry",
                     crowd_id: Crowd.first.id)
      hat = Trait.create(description: "Hat",
                   answer: "Yes",)
      PersonTraits.create(person_id: fred.id,
                          trait_id: hat.id)
      PersonTraits.create(person_id: boris.id,
                          trait_id: hat.id)
  end

  context 'on creation' do
    it 'has a crowd of 4' do
      expect(subject.crowd.length).to eq 4
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

  context 'player can see all the people that have not been eliminated' do

    it { is_expected.to respond_to(:show_all) }

    it 'at the start of the game' do
      subject.choose('Fred')
      expect(subject.show_all.length).to eq 4
    end
    it 'during the game' do
      subject.choose('Fred')
      boris = Person.first(name: 'Boris')
      boris.up = false
      boris.save
      expect(subject.show_all.length).to eq 3
    end
  end

  context 'player can ask if he has a hat' do

    it { is_expected.to respond_to(:correct_guess) }
    it { is_expected.to respond_to(:incorrect_guess) }
    it { is_expected.to respond_to(:ask).with(1).argument }

    it 'and will say yes if correct' do
      subject.choose('Fred')
      expect(subject.ask('Hat')).to eq 'Yes'
    end
    it 'and will remove the people not wearing a hat if yes' do
      subject.choose('Fred')
      subject.ask('Hat')
      expect(subject.show_all.length).to eq 2
    end
    it 'and will say no if incorrect' do
      subject.choose('John')
      expect(subject.ask('Hat')).to eq 'No'
    end
    it 'and will remove the people wearing a hat if no' do
      subject.choose('John')
      subject.ask('Hat')
      expect(subject.show_all.length).to eq 2
    end
  end
end
