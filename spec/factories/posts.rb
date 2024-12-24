
# a factory to test the post creation logic
FactoryBot.define do
  factory :post do
    title { "Test Post" }
    body { "This is a test post content" }
    association :user
  end
end
