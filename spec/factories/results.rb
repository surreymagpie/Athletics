# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :result do
    athlete FactoryGirl.create :athlete
    race nil
    position 1
    str_time "18:23"
    division 2
    category "U13"
    club "RAN"
  end
end
