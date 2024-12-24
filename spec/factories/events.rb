FactoryBot.define do
  factory :event do
    title { "Test Event" }
    description { "Will it work?" }
    date { "2024-12-21 18:07:08" }
    location { "Testing environment" }
  end
end
