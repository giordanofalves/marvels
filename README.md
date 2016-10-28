# Marvels
[![Build Status](https://travis-ci.org/giordanofalves/marvels.svg?branch=master)](https://travis-ci.org/giordanofalves/marvels)
[![Code Climate](https://codeclimate.com/github/giordanofalves/marvels/badges/gpa.svg)](https://codeclimate.com/github/giordanofalves/marvels)
[![Test Coverage](https://codeclimate.com/github/giordanofalves/marvels/badges/coverage.svg)](https://codeclimate.com/github/giordanofalves/marvels/coverage)

* Ruby version: 2.3.1
* Rails version: 5.0.0.1

## Synopsis
I created this project to studies good practice in Ruby on Rails.

My goals are:
* A beautiful code
* Min 95% code covered by specs
* Use great tools like Travis CI, Code Climate and SimpleCov
* A good layout(my weakness)
* Publish this project in heroku server



## Installing

```console
git clone https://github.com/giordanofalves/marvels.git
cp config/database.yml.example config/database.yml
cp config/secrets.yml.example config/secrets.yml
bundle install
```

## System dependencies
  ### Marvel API

  ###### How to get a key
  Access [developer.marvel.com](https://developer.marvel.com/) and click in Get a Key.
  You need a marvel account.

  ###### Config Marvel API in Marvels
  Export environment variables in your system

  ```
  export MARVEL_API_PUBLIC="PUT HERE YOUR PUBLIC KEY"
  export MARVEL_API_PRIVATE="PUT HERE YOUR PRIVATE KEY"
  ```

  ### Facebook API
  ###### How to get a key
  Access [developers.facebook.com](https://developers.facebook.com/) to get your key.

  ###### Config Facebook API in Marvels
  Export environment variables in your system

  ```
  export FACEBOOK_API_ID="PUT HERE YOUR ID KEY"
  export FACEBOOK_API_SECRET="PUT HERE YOUR SECRETE KEY"
  ```

## Database creation
```console
  bundle exec rails db:setup
```

## Data

Run [import_characters_data.rake](https://github.com/giordanofalves/marvels/blob/master/lib/tasks/import_characters_data.rake) task to import characters data.
```console
 rails characters:import_data
```
## How to run the test suite
```console
rspec ./spec
```
