require './app/server'
require 'byebug'

describe Player do

  before(:each) do
      Crowd.create()
    fred = Person.create(name: "Fred",
                         crowd_id: Crowd.first.id,
                         picture: '/images/fred.jpg')
    boris = Person.create(name: "Boris",
                          crowd_id: Crowd.first.id,
                          picture: '/images/boris.jpg')
    john = Person.create(name: "John",
                         crowd_id: Crowd.first.id,
                          picture: '/images/john.jpg')
    barry = Person.create(name: "Barry",
                          crowd_id: Crowd.first.id,
                           picture: '/images/barry.jpg')
    brian = Person.create(name: "Brian",
                          crowd_id: Crowd.first.id,
                           picture: '/images/brian.jpg')
      hat = Trait.create(description: "Hat",
                   answer: "Yes",)
      black_hair = Trait.create(description: "Black Hair",
                   answer: "Yes",)
      PersonTraits.create(person_id: fred.id,
                          trait_id: hat.id)
      PersonTraits.create(person_id: boris.id,
                          trait_id: hat.id)
      PersonTraits.create(person_id: brian.id,
                          trait_id: hat.id)
      PersonTraits.create(person_id: brian.id,
                          trait_id: black_hair.id)
  end

  context 'on creation' do
    it 'has a crowd of 4' do
      expect(subject.crowd.length).to eq 5
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
      expect(subject.show_all.length).to eq 5
    end
    it 'during the game' do
      subject.choose('Fred')
      boris = Person.first(name: 'Boris')
      boris.up = false
      boris.save
      expect(subject.show_all.length).to eq 4
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
      expect(subject.show_all.length).to eq 3
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

  context 'player chooses Brian, asks if he has a hat, and then black hair' do

    it 'and the crowd will be reduced correctly' do
      subject.choose('Brian')
      subject.ask('Hat')
      subject.ask('Black Hair')
      expect(subject.show_all.length).to eq 1
    end
  end

  context 'player can guess the person' do

    context 'and win the game' do

      it 'when there is one person left' do
        subject.choose('Brian')
        subject.ask('Hat')
        subject.ask('Black Hair')
        expect(subject.is_it('Brian')).to eq "You win!"
      end
      it 'when there are many people left' do
        subject.choose('Fred')
        expect(subject.is_it('Fred')).to eq "You win!"
      end
    end

    context 'but if they guess wrong' do

      it 'they do not win' do
        subject.choose('Fred')
        subject.ask('Hat')
        expect(subject.is_it('Boris')).to eq "Try again!"
      end
    end
  end
end

