class Crowd

  include DataMapper::Resource

  property :id,     Serial # Serial means that it will be auto-incremented for every record

  has n, :person, through: Resource

end