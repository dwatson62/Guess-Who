class Person

  include DataMapper::Resource

  #defines the many-to-many relationship
  # has n, :tags, through: Resource

  # This block describes what resources our model will have
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :name,         String
  property :up?, Boolean, :default => true
  property :picture, String

  has n, :traits, through: Resource
  belongs_to :crowd

end