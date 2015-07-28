require './app/server'

def test_db
  crowd = Crowd.create
  fred = Person.create(name: 'Fred',
                       crowd_id: crowd.id,
                       picture: '/images/fred.jpg')
  boris = Person.create(name: 'Boris',
                        crowd_id: crowd.id,
                        picture: '/images/boris.jpg')
  john = Person.create(name: 'John',
                       crowd_id: crowd.id,
                       picture: '/images/john.jpg')
  barry = Person.create(name: 'Barry',
                        crowd_id: crowd.id,
                        picture: '/images/barry.jpg')
  brian = Person.create(name: 'Brian',
                        crowd_id: crowd.id,
                        picture: '/images/brian.jpg')
  hat = Trait.create(description: 'Hat')
  black_hair = Trait.create(description: 'BlackHair')
  brown_hair = Trait.create(description: 'BrownHair')
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

def april_db
  crowd = Crowd.create
  2.times { Player.create }

  dan = Person.create(name: 'Dan',
                      crowd_id: crowd.id,
                      picture: '/images/dan.jpg')
  daryl = Person.create(name: 'Daryl',
                        crowd_id: crowd.id,
                        picture: '/images/daryl.jpg')
  fiona = Person.create(name: 'Fiona',
                        crowd_id: crowd.id,
                        picture: '/images/fiona.jpg')
  rodney = Person.create(name: 'Rodney',
                         crowd_id: crowd.id,
                         picture: '/images/rodney.jpg')
  mollie = Person.create(name: 'Mollie',
                         crowd_id: crowd.id,
                         picture: '/images/mollie.jpg')
  andy = Person.create(name: 'Andy',
                       crowd_id: crowd.id,
                       picture: '/images/andy.jpg')
  alex = Person.create(name: 'Alex',
                       crowd_id: crowd.id,
                       picture: '/images/alex.jpg')
  jennifer = Person.create(name: 'Jennifer',
                           crowd_id: crowd.id,
                           picture: '/images/jennifer.jpg')
  ashleigh = Person.create(name: 'Ashleigh',
                           crowd_id: crowd.id,
                           picture: '/images/ashleigh.jpg')
  chidu = Person.create(name: 'Chidu',
                        crowd_id: crowd.id,
                        picture: '/images/chidu.jpg')
  timo = Person.create(name: 'TimO',
                       crowd_id: crowd.id,
                       picture: '/images/timo.jpg')
  charlie = Person.create(name: 'Charlie',
                          crowd_id: crowd.id,
                          picture: '/images/charlie.jpg')
  timr = Person.create(name: 'TimR',
                       crowd_id: crowd.id,
                       picture: '/images/timr.jpg')
  daniel = Person.create(name: 'Daniel',
                         crowd_id: crowd.id,
                         picture: '/images/daniel.jpg')
  stefan = Person.create(name: 'Stefan',
                         crowd_id: crowd.id,
                         picture: '/images/stefan.jpg')
  ben = Person.create(name: 'Ben',
                      crowd_id: crowd.id,
                      picture: '/images/ben.jpg')

  # types of traits

  male = Trait.create(description: 'Male')
  female = Trait.create(description: 'Female')
  silly_face = Trait.create(description: 'SillyFace')
  beard = Trait.create(description: 'Beard')
  stubble = Trait.create(description: 'Stubble')
  clean_shaven = Trait.create(description: 'CleanShaven')
  glasses = Trait.create(description: 'Glasses')
  black_hair = Trait.create(description: 'BlackHair')
  brown_hair = Trait.create(description: 'BrownHair')
  blonde_hair = Trait.create(description: 'BlondeHair')
  long_hair = Trait.create(description: 'LongHair')
  short_hair = Trait.create(description: 'ShortHair')
  curly_hair = Trait.create(description: 'CurlyHair')
  light_top = Trait.create(description: 'LightTop')
  blue_top = Trait.create(description: 'BlueTop')
  dark_top = Trait.create(description: 'DarkTop')
  checkered_top = Trait.create(description: 'CheckeredTop')
  chidu_top = Trait.create(description: 'ChiduTop')
  necklace = Trait.create(description: 'Necklace')
  cigarette = Trait.create(description: 'Cigarette')

  male_group = [dan, daryl, rodney, andy, alex, chidu, timo, charlie, timr, daniel, stefan, ben]
  female_group = [mollie, jennifer, ashleigh, fiona]
  silly_face_group = [rodney, ashleigh, charlie, daniel, ben]
  beard_group = [dan, rodney]
  stubble_group = [dan, andy, alex, timo, charlie, timr, daniel, stefan, ben]
  clean_shaven_group = [daryl, fiona, mollie, jennifer, ashleigh, chidu]
  glasses_group = [dan, mollie, andy]
  black_hair_group = [fiona, mollie, andy, jennifer, chidu, stefan]
  brown_hair_group = [dan, daryl, rodney, charlie, timr, daniel, ben]
  blonde_hair_group = [alex, ashleigh, timo]
  long_hair_group = [mollie, andy, jennifer, ashleigh]
  short_hair_group = [dan, daryl, fiona, rodney, alex, chidu, timo, charlie, timr, daniel, stefan, ben]
  curly_hair_group = [mollie, jennifer]
  light_top_group = [dan, fiona, mollie, andy, ashleigh]
  blue_top_group = [daryl, rodney, alex, jennifer, timr, stefan, ben]
  dark_top_group = [charlie]
  checkered_top_group = [timo, daniel]
  necklace_group = [rodney, mollie, jennifer]

  male_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: male.id)
  end
  female_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: female.id)
  end
  silly_face_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: silly_face.id)
  end
  beard_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: beard.id)
  end
  stubble_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: stubble.id)
  end
  clean_shaven_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: clean_shaven.id)
  end
  glasses_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: glasses.id)
  end
  black_hair_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: black_hair.id)
  end
  brown_hair_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: brown_hair.id)
  end
  blonde_hair_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: blonde_hair.id)
  end
  long_hair_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: long_hair.id)
  end
  short_hair_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: short_hair.id)
  end
  curly_hair_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: curly_hair.id)
  end
  light_top_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: light_top.id)
  end
  blue_top_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: blue_top.id)
  end
  dark_top_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: dark_top.id)
  end
  checkered_top_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: checkered_top.id)
  end
  necklace_group.each do |person|
    PersonTraits.create(person_id: person.id,
                        trait_id: necklace.id)
  end
  PersonTraits.create(person_id: chidu.id,
                      trait_id: chidu_top.id)
  PersonTraits.create(person_id: stefan.id,
                      trait_id: cigarette.id)
end
