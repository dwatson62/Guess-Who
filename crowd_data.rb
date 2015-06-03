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

    # april people

    dan = Person.create(name: "Dan",
                         crowd_id: Crowd.first.id,
                         picture: '/images/dan.jpg')
    daryl = Person.create(name: "Daryl",
                         crowd_id: Crowd.first.id,
                         picture: '/images/daryl.jpg')
    fiona = Person.create(name: "Fiona",
                         crowd_id: Crowd.first.id,
                         picture: '/images/fiona.jpg')
    rodney = Person.create(name: "Rodney",
                         crowd_id: Crowd.first.id,
                         picture: '/images/rodney.jpg')
    mollie = Person.create(name: "Mollie",
                         crowd_id: Crowd.first.id,
                         picture: '/images/mollie.jpg')
    andy = Person.create(name: "Andy",
                         crowd_id: Crowd.first.id,
                         picture: '/images/andy.jpg')
    alex = Person.create(name: "Alex",
                         crowd_id: Crowd.first.id,
                         picture: '/images/alex.jpg')
    jennifer = Person.create(name: "jennifer",
                         crowd_id: Crowd.first.id,
                         picture: '/images/jennifer.jpg')
    ashleigh = Person.create(name: "Ashleigh",
                         crowd_id: Crowd.first.id,
                         picture: '/images/ashleigh.jpg')
    chidu = Person.create(name: "Chidu",
                         crowd_id: Crowd.first.id,
                         picture: '/images/chidu.jpg')
    timo = Person.create(name: "TimO",
                         crowd_id: Crowd.first.id,
                         picture: '/images/timo.jpg')
    charlie = Person.create(name: "Charlie",
                         crowd_id: Crowd.first.id,
                         picture: '/images/charlie.jpg')
    timr = Person.create(name: "TimR",
                         crowd_id: Crowd.first.id,
                         picture: '/images/timr.jpg')
    daniel = Person.create(name: "Daniel",
                         crowd_id: Crowd.first.id,
                         picture: '/images/daniel.jpg')
    stefan = Person.create(name: "Stefan",
                         crowd_id: Crowd.first.id,
                         picture: '/images/stefan.jpg')

    # types of traits

    male = Trait.create(description: "Male")
    female = Trait.create(description: "Female")
    silly_face = Trait.create(description: "SillyFace")
    beard = Trait.create(description: "Beard")
    stubble = Trait.create(description: "Stubble")
    clean_shaven = Trait.create(description: "CleanShaven")
    glasses = Trait.create(description: "Glasses")
    black_hair = Trait.create(description: "BlackHair")
    brown_hair = Trait.create(description: "BrownHair")
    blonde_hair = Trait.create(description: "BlondeHair")
    long_hair = Trait.create(description: "LongHair")
    short_hair = Trait.create(description: "ShortHair")
    curly_hair = Trait.create(description: "CurlyHair")
    light_top = Trait.create(description: "LightTop")
    blue_top = Trait.create(description: "BlueTop")
    green_top = Trait.create(description: "GreenTop")
    blue_top = Trait.create(description: "BlueTop")
    dark_top = Trait.create(description: "DarkTop")
    checkered_top = Trait.create(description: "CheckeredTop")
    chidu_top = Trait.create(description: "ChiduTop")
    necklace = Trait.create(description: "Necklace")
    cigarette = Trait.create(description: "Cigarette")

    # Dan's traits

    PersonTraits.create(person_id: dan.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: dan.id,
                        trait_id: glasses.id)
    PersonTraits.create(person_id: dan.id,
                        trait_id: beard.id)
    PersonTraits.create(person_id: dan.id,
                        trait_id: light_top.id)
    PersonTraits.create(person_id: dan.id,
                        trait_id: brown_hair.id)
    PersonTraits.create(person_id: dan.id,
                        trait_id: short_hair.id)

    # Daryl'ls traits

    PersonTraits.create(person_id: daryl.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: daryl.id,
                        trait_id: clean_shaven.id)
    PersonTraits.create(person_id: daryl.id,
                        trait_id: brown_hair.id)
    PersonTraits.create(person_id: daryl.id,
                        trait_id: short_hair.id)
    PersonTraits.create(person_id: daryl.id,
                        trait_id: blue_top.id)

    # Fiona's traits

    PersonTraits.create(person_id: fiona.id,
                        trait_id: female.id)
    PersonTraits.create(person_id: fiona.id,
                        trait_id: clean_shaven.id)
    PersonTraits.create(person_id: fiona.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: fiona.id,
                        trait_id: short_hair.id)
    PersonTraits.create(person_id: fiona.id,
                        trait_id: light_top.id)

    # Rodney's traits

    PersonTraits.create(person_id: rodney.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: rodney.id,
                        trait_id: beard.id)
    PersonTraits.create(person_id: rodney.id,
                        trait_id: short_hair.id)
    PersonTraits.create(person_id: rodney.id,
                        trait_id: brown_hair.id)
    PersonTraits.create(person_id: rodney.id,
                        trait_id: necklace.id)
    PersonTraits.create(person_id: rodney.id,
                        trait_id: green_top.id)
    PersonTraits.create(person_id: rodney.id,
                        trait_id: silly_face.id)

    # Mollie's traits

    PersonTraits.create(person_id: mollie.id,
                        trait_id: female.id)
    PersonTraits.create(person_id: mollie.id,
                        trait_id: clean_shaven.id)
    PersonTraits.create(person_id: mollie.id,
                        trait_id: glasses.id)
    PersonTraits.create(person_id: mollie.id,
                        trait_id: long_hair.id)
    PersonTraits.create(person_id: mollie.id,
                        trait_id: curly_hair.id)
    PersonTraits.create(person_id: mollie.id,
                        trait_id: necklace.id)
    PersonTraits.create(person_id: mollie.id,
                        trait_id: black_hair.id)

    # Andy's traits

    PersonTraits.create(person_id: andy.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: andy.id,
                        trait_id: glasses.id)
    PersonTraits.create(person_id: andy.id,
                        trait_id: stubble.id)
    PersonTraits.create(person_id: andy.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: andy.id,
                        trait_id: long_hair.id)
    PersonTraits.create(person_id: andy.id,
                        trait_id: light_top.id)

    # Alex's traits

    PersonTraits.create(person_id: alex.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: alex.id,
                        trait_id: stubble.id)
    PersonTraits.create(person_id: alex.id,
                        trait_id: blonde_hair.id)
    PersonTraits.create(person_id: alex.id,
                        trait_id: short_hair.id)
    PersonTraits.create(person_id: alex.id,
                        trait_id: blue_top.id)

    # Jennifer's traits

    PersonTraits.create(person_id: jennifer.id,
                        trait_id: female.id)
    PersonTraits.create(person_id: jennifer.id,
                        trait_id: clean_shaven.id)
    PersonTraits.create(person_id: jennifer.id,
                        trait_id: curly_hair.id)
    PersonTraits.create(person_id: jennifer.id,
                        trait_id: long_hair.id)
    PersonTraits.create(person_id: jennifer.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: jennifer.id,
                        trait_id: necklace.id)
    PersonTraits.create(person_id: jennifer.id,
                        trait_id: blue_top.id)

    # Ashleigh's traits

    PersonTraits.create(person_id: ashleigh.id,
                        trait_id: female.id)
    PersonTraits.create(person_id: ashleigh.id,
                        trait_id: clean_shaven.id)
    PersonTraits.create(person_id: ashleigh.id,
                        trait_id: long_hair.id)
    PersonTraits.create(person_id: ashleigh.id,
                        trait_id: blonde_hair.id)
    PersonTraits.create(person_id: ashleigh.id,
                        trait_id: silly_face.id)
    PersonTraits.create(person_id: ashleigh.id,
                        trait_id: light_top.id)

    # Chidu's traits

    PersonTraits.create(person_id: chidu.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: chidu.id,
                        trait_id: clean_shaven.id)
    PersonTraits.create(person_id: chidu.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: chidu.id,
                        trait_id: short_hair.id)
    PersonTraits.create(person_id: chidu.id,
                        trait_id: chidu_top.id)

    # Tim O's traits

    PersonTraits.create(person_id: timo.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: timo.id,
                        trait_id: stubble.id)
    PersonTraits.create(person_id: timo.id,
                        trait_id: blonde_hair.id)
    PersonTraits.create(person_id: timo.id,
                        trait_id: short_hair.id)
    PersonTraits.create(person_id: timo.id,
                        trait_id: checkered_top.id)

    # Charlie's traits

    PersonTraits.create(person_id: charlie.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: charlie.id,
                        trait_id: stubble.id)
    PersonTraits.create(person_id: charlie.id,
                        trait_id: silly_face.id)
    PersonTraits.create(person_id: charlie.id,
                        trait_id: brown_hair.id)
    PersonTraits.create(person_id: charlie.id,
                        trait_id: short_hair.id)
    PersonTraits.create(person_id: charlie.id,
                        trait_id: dark_top.id)

    # Tim R's traits

    PersonTraits.create(person_id: timr.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: timr.id,
                        trait_id: stubble.id)
    PersonTraits.create(person_id: timr.id,
                        trait_id: short_hair.id)
    PersonTraits.create(person_id: timr.id,
                        trait_id: brown_hair.id)
    PersonTraits.create(person_id: timr.id,
                        trait_id: blue_top.id)

    # Daniel's traits

    PersonTraits.create(person_id: daniel.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: daniel.id,
                        trait_id: stubble.id)
    PersonTraits.create(person_id: daniel.id,
                        trait_id: short_hair.id)
    PersonTraits.create(person_id: daniel.id,
                        trait_id: brown_hair.id)
    PersonTraits.create(person_id: daniel.id,
                        trait_id: checkered_top.id)
    PersonTraits.create(person_id: daniel.id,
                        trait_id: silly_face.id)

    # Stefan's traits

    PersonTraits.create(person_id: stefan.id,
                        trait_id: male.id)
    PersonTraits.create(person_id: stefan.id,
                        trait_id: cigarette.id)
    PersonTraits.create(person_id: stefan.id,
                        trait_id: stubble.id)
    PersonTraits.create(person_id: stefan.id,
                        trait_id: black_hair.id)
    PersonTraits.create(person_id: stefan.id,
                        trait_id: short_hair.id)
    PersonTraits.create(person_id: stefan.id,
                        trait_id: blue_top.id)

end