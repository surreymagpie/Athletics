# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :race_score do
    club nil
    race nil
    team_name "MyString"
    score 1
  end
end
