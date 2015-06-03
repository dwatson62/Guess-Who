class Player
  include DataMapper::Resource

  property :id,     Serial

  has 1, :person, through: Resource
end
