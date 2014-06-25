# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :result do
    athlete nil
    race nil
    position 1
    time 6000
    division 2
    category "U13"
    club "RAN"
  end
end
