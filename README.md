# Surrey Ladies Cross Country League Application

This application is in development to present a method of automating the production of race results from cross-country races.

It is now using Rails v5.0 on Ruby v2.4.1 with a Postgresql database

To set up:

```sh
git clone https://github.com/surreymagpie/Athletics
cp config/example.config.yml config/config.yml
bundle install
rails db:setup
```

It is tested using RSpec and Capybara.To run the tests, run `bundle exec guard`
