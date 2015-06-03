class Crowd
  include DataMapper::Resource

  property :id,     Serial

  has n, :person, through: Resource
end
