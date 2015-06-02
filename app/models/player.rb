require './app/models/person'
require './app/models/trait'
require './app/models/crowd'
require './app/models/person_traits'

require 'byebug'

class Player

  attr_accessor :character, :crowd

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
    trait = Trait.first(description: item)
    person = PersonTraits.first(person_id: id, trait_id: trait.id)
    ids = []
    if person
      p "This is the crowd"
      p @crowd
      p "These are the list of person_traits"
      p @person_traits
      @person_traits.each do |thing|
        if thing.trait_id == trait.id
          p "This is the persons id that has the trait being asked"
          ids << thing.person_id
        end
      end
        p 'these are all the ids'
        p ids
        target = Person.all(:id.not => ids)
        p 'These are the targets'
        p target
        # target.map! { |x| x.id }
        newtarget = []
        target.each do |x|
          newtarget << x.id
        end
        p 'These are the targets ids'
        p newtarget
        newtarget.each do |x|
          hit = Person.first(id: x)
          hit.up = false
          hit.save
        end
      # then the player guessed correctly,
      # and all characters not wearing this item
      # must have their up? property made false
      "Yes"
    else
      # then the player guessed incorrectly,
      # and all characters that are wearing this item
      # must have their up? property made false
      "No"
    end
  end

end