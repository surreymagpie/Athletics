require 'factory_girl_rails'

FactoryGirl.define do
  factory :fixture do
    date      Date.parse('07-12-2013')
    location  "Richmond Park"
  end
end