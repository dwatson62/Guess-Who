Guess Who
=======================

[![Code Climate](https://codeclimate.com/github/dwatson62/Guess-Who/badges/gpa.svg)](https://codeclimate.com/github/dwatson62/Guess-Who) [![Build Status](https://travis-ci.org/dwatson62/Guess-Who.svg?branch=master)](https://travis-ci.org/dwatson62/Guess-Who) [![Coverage Status](https://coveralls.io/repos/dwatson62/Guess-Who/badge.svg?branch=master&service=github)](https://coveralls.io/github/dwatson62/Guess-Who?branch=master)

## Synopsis

During Lab Week at Makers Academy, I decided as my personal project to create Guess Who, using my fellow students as the characters. I used the technologies that I had been learning at the time; Ruby and Sinatra for the framework.

I found this project quite fun and a great way to practice Ruby backend skills and database management. In particular, this taught me a lot about database associations, pairing up different traits to each character.

Also available at https://thawing-peak-9435.herokuapp.com/

## To install from terminal

- Make sure you have psql installed in order to create the databases

- ``` git clone https://github.com/dwatson62/Guess-Who ```
- ```psql -c 'create database guesswho_development;'```
- ``` bundle ```
- ```rake populate_local``` to populate the game database
- ```rackup```
- Visit [http://localhost:9292](http://localhost:9292)

To run the tests after installation:

- ```psql -c 'create database guesswho_test;'```
- ```rspec```

## Technologies Used

- Ruby
- Datamapper, Postgres
- Sinatra
- Rspec, Capybara
