require './app/server'

def test_db1
    Crowd.create()
    fred = Person.create(name: "Fred",
                         crowd_id: Crowd.first.id,
                         picture: '/images/fred.jpg')
    boris = Person.create(name: "Boris",
                          crowd_id: Crowd.first.id,
                          picture: '/images/boris.jpg')
    john = Person.create(name: "John",
                         crowd_id: Crowd.first.id,
                          picture: '/images/john.jpg')
    barry = Person.create(name: "Barry",
                          crowd_id: Crowd.first.id,
                           picture: '/images/barry.jpg')
    brian = Person.create(name: "Brian",
                          crowd_id: Crowd.first.id,
                           picture: '/images/brian.jpg')
    hat = Trait.create(description: "Hat")
    black_hair = Trait.create(description: "BlackHair")
    brown_hair = Trait.create(description: "BrownHair")
    PersonTraits.create(person_id: fred.id,
                        trait_id: hat.id)
    PersonTraits.create(person_id: boris.id,
                        trait_id: hat.id)
    PersonTraits.create(person_id: brian.id,
                        trait_id: hat.id)
    PersonTraits.create(person_id: brian.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: john.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: barry.id,
                        trait_id: brown_hair.id)
end
def test_db2
    Crowd.create()
    fred = Person.create(name: "Fred",
                         crowd_id: Crowd.first.id,
                         picture: '/images/fred.jpg')
    boris = Person.create(name: "Boris",
                          crowd_id: Crowd.first.id,
                          picture: '/images/boris.jpg')
    john = Person.create(name: "John",
                         crowd_id: Crowd.first.id,
                          picture: '/images/john.jpg')
    barry = Person.create(name: "Barry",
                          crowd_id: Crowd.first.id,
                           picture: '/images/barry.jpg')
    brian = Person.create(name: "Brian",
                          crowd_id: Crowd.first.id,
                           picture: '/images/brian.jpg')
    daryl = Person.create(name: "Daryl",
                         crowd_id: Crowd.first.id,
                         picture: '/images/daryl.jpg')
    hat = Trait.create(description: "Hat")
    black_hair = Trait.create(description: "BlackHair")
    brown_hair = Trait.create(description: "BrownHair")
    PersonTraits.create(person_id: fred.id,
                        trait_id: hat.id)
    PersonTraits.create(person_id: boris.id,
                        trait_id: hat.id)
    PersonTraits.create(person_id: brian.id,
                        trait_id: hat.id)
    PersonTraits.create(person_id: brian.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: john.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: barry.id,
                        trait_id: brown_hair.id)
end