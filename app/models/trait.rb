class Trait

  include DataMapper::Resource

  property :id,     Serial # Serial means that it will be auto-incremented for every record
  property :description,  String
  property :answerType,    String

  belongs_to :person

end