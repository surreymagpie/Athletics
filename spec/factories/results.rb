# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :result do
    athlete nil
    race nil
    position 1
    str_time "18:23"
    division 2
    category "U13"
    club "RAN"
  end
end
