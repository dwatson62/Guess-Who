require './app/server'
require './crowd_data'
require 'byebug'

describe Game do
  before(:each) do
    # byebug
    test_db
  end

  context 'on creation' do
    it 'has 1 crowd' do
      expect(Crowd.count).to eq 1
    end
    it 'has 4 people' do
      expect(Person.count).to eq 5
    end
    it 'has 3 different traits' do
      expect(Trait.count).to eq 3
    end
    it '6 links between people and traits' do
      expect(PersonTraits.count).to eq 6
    end
  end

  context 'can choose' do
    it { is_expected.to respond_to(:select).with(1).argument }
    it 'a character (Fred)' do
      subject.select('Fred')
      expect(subject.character.name).to eq('Fred')
    end
    it 'a character (Brian)' do
      subject.select('Brian')
      expect(subject.character.name).to eq('Brian')
    end
  end

  context 'player can see all the people that have not been eliminated' do
    it { is_expected.to respond_to(:show_all).with(1).argument }

    it 'at the start of the game' do
      subject.select('Fred')
      expect(subject.show_all(1).length).to eq 5
    end
    it 'during the game' do
      subject.select('Fred')
      boris = Person.first(name: 'Boris')
      boris.up1 = false
      boris.save
      expect(subject.show_all(1).length).to eq 4
    end
  end

  context 'player can ask' do
    it { is_expected.to respond_to(:correct_guess).with(1).argument }
    it { is_expected.to respond_to(:incorrect_guess).with(1).argument }
    it { is_expected.to respond_to(:flip_down).with(2).argument }
    it { is_expected.to respond_to(:ask).with(2).arguments }

    context 'if he has a hat' do
      it 'and will say yes if correct' do
        subject.select('Fred')
        expect(subject.ask('Hat', 1)).to eq 'Yes'
      end
      it 'and will remove the people not wearing a hat if yes' do
        subject.select('Fred')
        subject.ask('Hat', 1)
        expect(subject.show_all(1).length).to eq 3
      end
      it 'and will say no if incorrect' do
        subject.select('John')
        expect(subject.ask('Hat', 1)).to eq 'No'
      end
      it 'and will remove the people wearing a hat if no' do
        subject.select('John')
        subject.ask('Hat', 1)
        expect(subject.show_all(1).length).to eq 2
      end
    end

    context 'if he has black hair' do
      it 'and will say yes if correct' do
        subject.select('John')
        expect(subject.ask('BlackHair', 1)).to eq 'Yes'
      end
      it 'and will remove the people without black hair if yes' do
        subject.select('John')
        subject.ask('BlackHair', 1)
        expect(subject.show_all(1).length).to eq 2
      end
      it 'and will say no if incorrect' do
        subject.select('Barry')
        expect(subject.ask('BlackHair', 1)).to eq 'No'
      end
      it 'and will remove the people wearing a hat if no' do
        subject.select('Barry')
        subject.ask('BlackHair', 1)
        expect(subject.show_all(1).length).to eq 3
      end
    end

    context 'if he has brown hair' do
      it 'and will say yes if correct' do
        subject.select('Barry')
        expect(subject.ask('BrownHair', 1)).to eq 'Yes'
      end
      it 'and will remove the people without brown hair if yes' do
        subject.select('Barry')
        subject.ask('BrownHair', 1)
        expect(subject.show_all(1).length).to eq 1
      end
      it 'and will say no if incorrect' do
        subject.select('John')
        expect(subject.ask('BrownHair', 1)).to eq 'No'
      end
      it 'and will remove the people wearing a hat if no' do
        subject.select('John')
        subject.ask('BrownHair', 1)
        expect(subject.show_all(1).length).to eq 4
      end
    end
  end

  context 'player chooses Brian' do
    it 'and asks if he has brown hair' do
      subject.select('Brian')
      subject.ask('BrownHair', 1)
      expect(subject.show_all(1).length).to eq 4
    end
    it 'and asks if he has a hat' do
      subject.select('Brian')
      subject.ask('Hat', 1)
      expect(subject.show_all(1).length).to eq 3
    end
  end

  context 'player can accuse the person' do
    it 'and win the game' do
      subject.select('Fred')
      expect(subject.accuse('Fred', 1)).to eq 'You win!'
    end
    it 'but if they accuse wrong they do not win' do
      subject.select('Fred')
      expect(subject.accuse('Boris', 1)).to eq 'Try again!'
    end
    it 'an that character is eliminated from the game' do
      subject.select('Fred')
      subject.accuse('Boris', 1)
      expect(subject.show_all(1).length).to eq 4
    end
  end
end
