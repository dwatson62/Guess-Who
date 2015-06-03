require './app/models/person'
require './app/models/trait'
require './app/models/crowd'
require './app/models/person_traits'

require 'byebug'

class Game

  attr_reader :character

  def initialize
    @person_traits = PersonTraits.all
  end

  def choose(character)
    @character = Person.first(name: character)
    if @character == nil
      raise "Character not found"
    end
  end

  def show_all(player)
    if player == 1
      Person.all(up1: true)
    else
      Person.all(up2: true)
    end
  end

  def ask(item, player)
    id = character.id
    @trait = Trait.first(description: item)
    person = PersonTraits.first(person_id: id, trait_id: @trait.id)
    if person
      # then the player guessed correctly,
      # and all characters not wearing this item
      # must have their up? property made false
      correct_guess(player)
      "Yes"
    else
      # then the player guessed incorrectly,
      # and all characters that are wearing this item
      # must have their up? property made false
      incorrect_guess(player)
      "No"
    end
  end

  def correct_guess(player)
    ids = []
    @person_traits.each do |thing|
      if thing.trait_id == @trait.id
        ids << thing.person_id
      end
    end
    target = Person.all(:id.not => ids)
    newtarget = []
    target.each { |x| newtarget << x.id }
    newtarget.each do |x|
      hit = Person.first(id: x)
      if player == 1
        hit.up1 = false
      else
        hit.up2 = false
      end
      hit.save
    end
  end

  def incorrect_guess(player)
    ids = []
    @person_traits.each do |thing|
      if thing.trait_id == @trait.id
        ids << thing.person_id
      end
    end
    target = Person.all(id: ids)
    newtarget = []
    target.each { |x| newtarget << x.id }
    newtarget.each do |x|
      hit = Person.first(id: x)
      if player == 1
        hit.up1 = false
      else
        hit.up2 = false
      end
      hit.save
    end
  end

  def is_it(person, player)
    guess = Person.first(name: person)
    if guess.name == character.name
      # the player guessed correctly and wins
      'You win!'
    else
      if player == 1
        guess.up1 = false
      else
        guess.up2 = false
      end
      guess.save
      'Try again!'
    end
  end
end