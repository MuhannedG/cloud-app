require 'rails_helper'
# factory to test the comment logic
FactoryBot.define do
  factory :comment do
    body { "Test comment content" }
    association :user
    association :post
  end
end
