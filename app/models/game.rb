require './app/models/crowd'
require './app/models/person_traits'
require './app/models/person'
require './app/models/trait'

require 'byebug'

class Game
  attr_reader :character

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
    @ids = []
    PersonTraits.all.each do |thing|
      @ids << thing.person_id if thing.trait_id == trait.id
    end
    if person
      # then the player guessed correctly,
      # and all characters not wearing this item
      # must have their up? property made false
      correct_guess(player)
      'Yes'
    else
      # then the player guessed incorrectly,
      # and all characters that are wearing this item
      # must have their up? property made false
      incorrect_guess(player)
      'No'
    end
  end

  def correct_guess(player)
    @targets = Person.all(:id.not => @ids)
    find_people_to_flip(player)
  end

  def incorrect_guess(player)
    @targets = Person.all(id: @ids)
    find_people_to_flip(player)
  end

  def find_people_to_flip(player)
    people_to_flip = []
    @targets.each { |person| people_to_flip << person.id }
    flip_down(player, people_to_flip)
  end

  def flip_down(player, people_to_flip)
    people_to_flip.each do |person|
      hit = Person.first(id: person)
      if player == 1
        hit.up1 = false
      else
        hit.up2 = false
      end
      hit.save
    end
  end

  def accuse(person, player)
    guess = Person.first(name: person)
    if guess.name == character.name
      'You win!'
    else
      incorrectly_accuse(guess, player)
    end
  end

  def incorrectly_accuse(guess, player)
    if player == 1
      guess.up1 = false
    else
      guess.up2 = false
    end
    guess.save
    'Try again!'
  end
end
