require './app/models/person'
require 'byebug'
class Player

  attr_accessor :character

  def choose(character)
    @character = Person.first(name: character)
    if @character == nil
      raise "Character not found"
    end
  end

  def who_has(item)
    trait = Trait.first(description: item)
    persontraits = PersonTrait.all(trait_id: trait.id)
    people = []
    persontraits.each do |x|
      people << Person.first(id: x.person_id)
    end
    people.sort! { |a, b| a.name <=> b.name }
  end
end