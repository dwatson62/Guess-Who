class Trait
  include DataMapper::Resource

  property :id, Serial
  property :description,  String

  has n, :person, through: Resource
end
