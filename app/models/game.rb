require './app/models/crowd'
require './app/models/person_traits'
require './app/models/person'
require './app/models/trait'

require 'byebug'

# This class handles backend game logic
class Game

  attr_reader :character

  def initialize
    @ids = []
  end

  def select(character)
    @character = Person.first(name: character)
  end

  def show_all(player)
    if player == 1
      Person.all(up1: true)
    else
      Person.all(up2: true)
    end
  end

  def ask(item, player)
    trait = Trait.first(description: item)
    person = PersonTraits.first(person_id: character.id, trait_id: trait.id)
    collect_people(trait)
    if person
      # player guessed correctly,
      # all characters not wearing this item
      # must have their up? property made false
      correct_guess(player)
    else
      # player guessed incorrectly,
      # all characters wearing this item
      # must have their up? property made false
      incorrect_guess(player)
    end
  end

  def collect_people(trait)
    PersonTraits.all.each do |person|
      @ids << person.person_id if person.trait_id == trait.id
    end
  end

  def correct_guess(player)
    @targets = Person.all(:id.not => @ids)
    find_people_to_flip(player)
    'Yes'
  end

  def incorrect_guess(player)
    @targets = Person.all(id: @ids)
    find_people_to_flip(player)
    'No'
  end

  def find_people_to_flip(player)
    people_to_flip = []
    @targets.each { |person| people_to_flip << person }
    flip_down(player, people_to_flip)
  end

  def flip_down(player, people_to_flip)
    people_to_flip.each do |person|
      hit = Person.first(id: person.id)
      if player == 1
        hit.up1 = false
      else
        hit.up2 = false
      end
      hit.save
    end
  end

  def accuse(person, player)
    guess = Array.new(1) { Person.first(name: person) }
    if guess.first.name == character.name
      'You win!'
    else
      flip_down(player, guess)
      'Try again!'
    end
  end

end
