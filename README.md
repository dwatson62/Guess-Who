Guess Who
=======================

## Synopsis

My project for Lab Week is to recreate Guess Who online, using the April cohort as the characters. This is to practice Ruby backend skills and database management.

![Guess Who](http://stayonfountain.com/wp-content/uploads/2011/01/guess-who.jpg)

## To install

- Clone into local repository
- Create the database locally in postgres "guesswho_development"
- Run "bundle"
- Run "rake populate_local" to populate the database with April cohort
- Run "rackup" and visit localhost://9292
- To restart the game run rake tasks "database_cleaner" and then "populate local"


Available at https://thawing-peak-9435.herokuapp.com/


## Technologies Used

- Ruby
- Datamapper, Postgres PSQL
- Sinatra
- Rspec, Capybara

## Job List

- Want to improve the style and look of the game
- Need to edit the database code so that the game can work in production
- Add the rest of the cohort