class PersonPlayer
  include DataMapper::Resource

  property :id,     Serial

  belongs_to :person
  belongs_to :player
end
