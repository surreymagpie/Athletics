require 'factory_bot_rails'

FactoryBot.define do
  factory :fixture do
    date      Date.parse('07-12-2013')
    location  "Richmond Park"
  end
end
