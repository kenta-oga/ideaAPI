FactoryBot.define do
  factory :idea_category do
    name { Faker::App.name }
    body { Faker::Lorem.sentence }
  end
end
