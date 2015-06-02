require './app/models/person'
require './app/models/trait'
require './app/models/crowd'
require './app/models/person_traits'

require 'byebug'

class Player

  attr_reader :character, :crowd

  def initialize
    @crowd = Person.all
    @person_traits = PersonTraits.all
  end

  def choose(character)
    @character = Person.first(name: character)
    if @character == nil
      raise "Character not found"
    end
  end

  def show_all
    @crowd = Person.all(up: true)
  end

  def ask(item)
    id = character.id
    @trait = Trait.first(description: item)
    person = PersonTraits.first(person_id: id, trait_id: @trait.id)
    if person
      # then the player guessed correctly,
      # and all characters not wearing this item
      # must have their up? property made false
      correct_guess
      "Yes"
    else
      # then the player guessed incorrectly,
      # and all characters that are wearing this item
      # must have their up? property made false
      incorrect_guess
      "No"
    end
  end

  def correct_guess
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
      hit.up = false
      hit.save
    end
  end

  def incorrect_guess
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
      hit.up = false
      hit.save
    end
  end
end