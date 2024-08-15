# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

`Ruby - 2.7.8`

* System dependencies

Minimal Linux Box Will Do

* Configuration

Adjust your `database.yml` file to reflect your local DB setup

* Database creation

Run `rake db:create` followed up by `rake db:migrate` to create the database and apply all the migrations  

* Database initialization

No need of intializing the database

* How to run the test suite

run `bundle exec rspec spec/*` to run the system specs 

* Services (job queues, cache servers, search engines, etc.)

There are no services or external applications as part of dependency chain to run this application

* Deployment instructions

NA

* VCR Cassettes

Have made use of `vcr` gem to create over the wire mocks which can be used to replay the API calls in an environment which we can later  check for assertions using a test framework like Rspec etc.,. For this application all the necessary vcr cassettes are stored inside `spec/vcr_cassettes` directory 
