require './app/models/person'
require './app/models/trait'
require './app/models/crowd'
require './app/models/person_traits'

require 'byebug'

class Player

  attr_accessor :character, :crowd

  def initialize
    @crowd = Person.all
  end

  def choose(character)
    @character = Person.first(name: character)
    if @character == nil
      raise "Character not found"
    end
  end

  def who_has(item)
    id = character.id
    trait = Trait.first(description: item)
    person = PersonTraits.first(person_id: id, trait_id: trait.id)
    p person
    if person
      "Yes"
      # then the player guessed correctly,
      # and all characters not wearing this item
      # must have their up? property made false
    else
      "No"
      # then the player guessed incorrectly,
      # and all characters that are wearing this item
      # must have their up? property made false
    end

    # persontraits = PersonTraits.all(trait_id: trait.id)
    # people = []
    # persontraits.each do |x|
    #   people << Person.first(id: x.person_id)
    # end
  end
end