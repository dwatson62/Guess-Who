class PersonTraits
  include DataMapper::Resource

  property :id, Serial

  belongs_to :person
  belongs_to :trait
end
