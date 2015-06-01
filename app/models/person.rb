# This class corresponds to a table in the database
# We can use it to manipulate the data
class Person

  # this makes the instances of this class Datamapper resources
  include DataMapper::Resource

  #defines the many-to-many relationship
  # has n, :tags, through: Resource

  # This block describes what resources our model will have
  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :name,         String
  property :trait1Answer, String

  has n, :traits
  belongs_to :crowd

end