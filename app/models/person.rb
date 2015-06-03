class Person
  include DataMapper::Resource

  property :id,     Serial
  property :name,         String
  property :up1?, Boolean, default: true
  property :up2?, Boolean, default: true
  property :picture, String

  has n, :traits, through: Resource
  belongs_to :crowd
  has 1, :player, through: Resource
end
