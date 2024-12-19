require 'rails_helper'
# a factory to test the post creation logic
FactoryBot.define do
  factory :post do
    title { "Post Test" }
    body { "This is a test post content" }
    association :user
  end
end
