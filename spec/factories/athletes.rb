require 'factory_girl_rails'

FactoryGirl.define do
  factory :athlete do
    first_name  "Billy"
    last_name  "NoMates"
    dob 30.years.ago
  end
end