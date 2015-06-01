class Trait

  include DataMapper::Resource

  property :id, Serial # Serial means that it will be auto-incremented for every record
  property :description,  String
  property :answer,    String

  belongs_to :person, :required => false

end